class Order < ActiveRecord::Base
  attr_accessible :current_study_group, :type

  belongs_to :user, :inverse_of => :orders
  belongs_to :orderable, :polymorphic => true
end
