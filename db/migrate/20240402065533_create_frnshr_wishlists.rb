class CreateFrnshrWishlists < ActiveRecord::Migration[7.1]
  def change
    create_table :frnshr_wishlists do |t|
      t.references :frnshr_room, null: false, foreign_key: true
      t.references :frnshr_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
