class Subsidy < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :order, :as => :orderable
  belongs_to :basis
  belongs_to :subsidy_type
end
