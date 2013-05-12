class TransportSubsidy < ActiveRecord::Base
  resourcify
  attr_accessible :arrival, :departure
  has_one :order, :as => :orderable
end
