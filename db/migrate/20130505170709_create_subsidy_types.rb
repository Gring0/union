class CreateSubsidyTypes < ActiveRecord::Migration
  def change
    create_table :subsidy_types do |t|
      t.string :name
      t.boolean :enabled
      t.text :description
    end
  end
end
