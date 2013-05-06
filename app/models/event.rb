class Event < ActiveRecord::Base
  attr_accessible :amount, :description, :students
  has_one :order, :as => :orderable
end
