class CreateBreads < ActiveRecord::Migration[5.2]
  def change
    create_table :breads do |t|
      t.string :type
      t.string :sale_form
      t.decimal :price
      t.timestamps null: false
    end
  end
end
