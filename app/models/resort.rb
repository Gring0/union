class Resort < ActiveRecord::Base
  resourcify
  attr_accessible :tour_id
  has_one :order, :as => :orderable
  has_one :tour, :as => :tourable
end
