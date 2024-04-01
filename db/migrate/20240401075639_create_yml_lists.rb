class CreateYmlLists < ActiveRecord::Migration[7.1]
  def change
    create_table :yml_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
