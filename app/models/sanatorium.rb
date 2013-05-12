class Sanatorium < ActiveRecord::Base
  resourcify
  # attr_accessible :title, :body
  has_one :order, :as => :orderable
  has_one :tour, :as => :tourable
end
