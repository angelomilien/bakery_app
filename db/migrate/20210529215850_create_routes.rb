class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :route_number
      t.integer :bakery_id
    end
  end
end
