class CreateFrnshrRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :frnshr_rooms do |t|
      t.text :palette, array: true, default: []
      t.string :room_type
      t.string :name
      t.references :frnshr_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
