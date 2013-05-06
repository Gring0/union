class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :type
      t.date :startdate
      t.date :enddate
      t.string :name
      t.boolean :enabled
    end
  end
end
