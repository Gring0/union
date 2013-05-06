class SocialActivity < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users, :inverse_of => :social_activity
end
