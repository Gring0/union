class AddReferenceToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :social_activity
    end
  end
end
