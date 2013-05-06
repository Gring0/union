class AddReferencesToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.references :user
      t.references :orderable, :polymorphic => true
    end
  end
end
