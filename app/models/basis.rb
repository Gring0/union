class Basis < ActiveRecord::Base
  resourcify
  attr_accessible :description, :enabled, :name
  has_many :subsidies, :inverse_of => :basis
end
