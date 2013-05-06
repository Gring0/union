class Basis < ActiveRecord::Base
  attr_accessible :description, :enabled, :name
  has_many :subsidies, :inverse_of => :basis
end
