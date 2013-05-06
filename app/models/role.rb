class Role < ActiveRecord::Base
  # attr_accessible :title, :body
  # will be include into Role.rb automaticaly
  has_many :users
  validates :name,  :presence => {:message => I18n.translate('the_role.name_presence')}
  validates :title, :presence => {:message => I18n.translate('the_role.title_presence')}
end
