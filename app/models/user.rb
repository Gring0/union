class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :academy_group, :card_number, :enabled, :uuid, :bank_account, :phone
  before_create :assign_role
  before_save :assign_student_role

  # attr_accessible :title, :body
  validates :name, :presence => {:message => "Пожалуйста, укажите вашу фамилию."}
  validates :email, :presence => {:message => "Пожалуйста, укажите вашу электронную почту."}
  validates :academy_group, :presence => {:message => "Пожалуйста, укажите вашу учебную группу."}
  validates :card_number, :presence => {:message => "Пожалуйста, укажите номер вашей зачётной книжки."}
  validates :phone, :presence => {:message => "Пожалуйста, укажите ваш телефонный номер."}
  validates :bank_account, :presence => {:message => "Пожалуйста, укажите номер вашего степендиального банковского счёта."}
  validates_uniqueness_of :name, :email, :case_sensitive => false
  validates_uniqueness_of :uuid, :allow_blank => true


  has_many :orders, :inverse_of => :user
  belongs_to :social_activity, :inverse_of => :users

  def assign_role
    # assign a default role if no role is assigned
    self.add_role :user if self.roles.first.nil?
  end

  def assign_student_role
    # assign a default role if no role is assigned
    if !self.uuid.nil? and self.enabled==true
      if !self.has_role? :student
        self.add_role :student
      end
    else
      if !self.has_role? :student
        self.remove_role :student
      end
    end
  end

  def update_student_info
    require 'open-uri'

    url = 'https://eu.bmstu.ru/modules/contingent/service/xml/students/'
    view_type = '?view=oldschool&'
    query = { 'uuid' => self.uuid }

    uri = url+view_type+query.to_param('search')
    response = open(uri, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE, :read_timeout => 10)
    response = response.read.force_encoding("UTF-8")

    #response = File.open('/Users/fuksman/union/public/bmstu.xml')

    @contingent = Hash.from_xml(response)
    if !@contingent.has_key?('contingent')
    elsif !@contingent['contingent'].has_key?('students') or !@contingent['contingent']['students'].has_key?('student') or @contingent['contingent']['students']['student'].length!=1
    end

    if @contingent.has_key?("contingent") and @contingent["contingent"].has_key?("students") and @contingent["contingent"]["students"].has_key?("student") and @contingent["contingent"]["students"]["student"].class == Hash
      student = @contingent["contingent"]["students"]["student"]
      self.uuid = student["uuid"].to_s
      self.name = student["lastName"].to_s+" "+student["firstName"].to_s+" "+student["middleName"].to_s
      self.card_number = student["cardNumber"]
      self.academy_group = student["group"]["titleshort"]
      study_type =  student["studyType"]["name"]
      state =  student["studentState"]["name"]
      self.enabled = (study_type == "Бюджетная" and state == "Обучается")
      self.save!
    else
      redirect_to root_path
      flash[:error] = "Ошибка при обновлении ваших данных: проблемы с «Электронным Университетом». Пожалуйста, попробуйте повторить операцию позже."
    end
  end

  def is_allowed?
    :enabled
  end
end
