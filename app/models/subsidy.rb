class Subsidy < ActiveRecord::Base
  resourcify
  attr_accessible :subsidy_type_id, :basis_id
  has_one :order, :as => :orderable
  belongs_to :basis
  belongs_to :subsidy_type
end
