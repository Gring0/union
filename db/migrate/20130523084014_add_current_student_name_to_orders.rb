class AddCurrentStudentNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :current_student_name, :string
    rename_column :orders, :current_study_group, :current_academy_group
  end
end
