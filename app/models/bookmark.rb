class Bookmark < ActiveRecord::Base

  belongs_to :user

  def self.all_bookmark_titles
    bookmarks = Bookmark.all

    display_titles = []
    bookmarks.each do |b|
      display_titles << "#{b.title}"
    end
  end

end
