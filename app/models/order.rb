class Order < ActiveRecord::Base
  resourcify
  attr_accessible :current_study_group, :type, :user_id, :current_academy_group, :current_student_name

  belongs_to :user, :inverse_of => :orders
  belongs_to :orderable, :polymorphic => true
end
