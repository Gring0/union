class Event < ActiveRecord::Base
  resourcify
  attr_accessible :amount, :description, :students
  has_one :order, :as => :orderable
end
