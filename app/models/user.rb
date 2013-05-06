class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body
  has_many :orders, :inverse_of => :user
  belongs_to :social_activity, :inverse_of => :users

  # will be include into User.rb automaticaly
  belongs_to :role
  after_save { |user| user.instance_variable_set(:@the_role, nil) }

# methods
  #the_role
  #admin?
  #moderator?(section)
  #has_role?(section, policy)
  #owner?(obj)

# instance variables
  #@the_role
end
