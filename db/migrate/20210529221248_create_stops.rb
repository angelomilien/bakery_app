class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :name
      t.string :adresse
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
