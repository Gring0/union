class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :type
      t.string :current_study_group

      t.timestamps
    end
  end
end
