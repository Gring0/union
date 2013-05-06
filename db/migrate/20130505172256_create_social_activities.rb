class CreateSocialActivities < ActiveRecord::Migration
  def change
    create_table :social_activities do |t|
      t.string :name
      t.boolean :enabled
      t.text :description
    end
  end
end
