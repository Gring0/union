class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.integer :tour_id
    end
  end
end
