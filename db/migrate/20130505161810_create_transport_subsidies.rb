class CreateTransportSubsidies < ActiveRecord::Migration
  def change
    create_table :transport_subsidies do |t|
      t.string :departure
      t.string :arrival
    end
  end
end
