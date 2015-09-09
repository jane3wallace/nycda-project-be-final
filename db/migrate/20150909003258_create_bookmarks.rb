class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.string :url
      t.string :title
      t.string :category
      t.string :subcategory
      t.datetime :date_added

      t.timestamps null: false
    end
  end
end
