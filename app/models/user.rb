class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  before_create :assign_role

  # attr_accessible :title, :body
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  has_many :orders, :inverse_of => :user
  belongs_to :social_activity, :inverse_of => :users

  def assign_role
    # assign a default role if no role is assigned
    self.add_role :user if self.roles.first.nil?
  end
end
