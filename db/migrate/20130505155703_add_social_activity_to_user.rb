class AddSocialActivityToUser < ActiveRecord::Migration
  def change
    add_column :users, :social_activity, :string
  end
end
