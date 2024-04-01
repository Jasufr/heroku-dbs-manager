class CreateYmlMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :yml_movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_url
      t.integer :rating

      t.timestamps
    end
  end
end
