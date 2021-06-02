class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.integer :bakery_id
      t.timestamps null: false
    end
  end
end
