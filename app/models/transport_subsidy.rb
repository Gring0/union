class TransportSubsidy < ActiveRecord::Base
  attr_accessible :arrival, :departure
  has_one :order, :as => :orderable
end
