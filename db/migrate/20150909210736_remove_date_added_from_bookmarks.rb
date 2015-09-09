class RemoveDateAddedFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :date_added, :datetime
  end
end
