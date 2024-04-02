class CreateFrnshrItems < ActiveRecord::Migration[7.1]
  def change
    create_table :frnshr_items do |t|
      t.string :name
      t.string :furniture_type
      t.integer :price
      t.string :color
      t.string :shop_name
      t.string :shop_item_id
      t.string :shop_url
      t.string :x_dimension
      t.string :y_dimension
      t.string :z_dimension
      t.string :photo

      t.timestamps
    end
  end
end
