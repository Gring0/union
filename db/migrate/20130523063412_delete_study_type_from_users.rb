class DeleteStudyTypeFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :study_type
    add_column :users, :enabled, :boolean
  end

  def down
    remove_column :users, :enabled
    add_column :users, :study_type, :string
  end
end
