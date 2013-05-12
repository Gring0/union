class AddRussianNameToRole < ActiveRecord::Migration
  def change
    add_column :roles, :russian_name, :string
  end
end
