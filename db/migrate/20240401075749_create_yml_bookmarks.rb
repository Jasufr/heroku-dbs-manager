class CreateYmlBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :yml_bookmarks do |t|
      t.text :comment
      t.references :yml_movie, null: false, foreign_key: true
      t.references :yml_list, null: false, foreign_key: true

      t.timestamps
    end

    add_index :yml_bookmarks, [:yml_movie_id, :yml_list_id], unique: true

  end
end
