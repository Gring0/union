class Tour < ActiveRecord::Base
  resourcify
  attr_accessible :enabled, :enddate, :name, :startdate, :type
  belongs_to :tourable, :polymorphic => true
end
