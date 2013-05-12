class SocialActivity < ActiveRecord::Base
  resourcify
  # attr_accessible :title, :body
  has_many :users, :inverse_of => :social_activity
end
