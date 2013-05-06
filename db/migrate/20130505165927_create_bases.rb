class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.string :name
      t.boolean :enabled, :default => true
      t.text :description
    end
  end
end
