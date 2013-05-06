class CreateSanatoria < ActiveRecord::Migration
  def change
    create_table :sanatoria do |t|
      t.integer :tour_id
    end
  end
end
