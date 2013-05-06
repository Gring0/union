class AddActualSocialActivityToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :actual_social_activity, :string
  end
end
