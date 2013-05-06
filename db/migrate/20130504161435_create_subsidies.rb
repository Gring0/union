class CreateSubsidies < ActiveRecord::Migration
  def change
    create_table :subsidies do |t|
      t.integer :subsidy_type_id
      t.integer :basis_id
    end
  end
end
