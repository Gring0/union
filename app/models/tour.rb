class Tour < ActiveRecord::Base
  attr_accessible :enabled, :enddate, :name, :startdate, :type
  belongs_to :tourable, :polymorphic => true
end
