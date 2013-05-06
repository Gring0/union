class AddReferenceToTour < ActiveRecord::Migration
  def change
    change_table :tours do |t|
      t.references :tourable, :polymorphic => true
    end
  end
end
