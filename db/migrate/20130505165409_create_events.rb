class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :students
      t.integer :amount
      t.text :description
    end
  end
end
