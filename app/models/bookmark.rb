class Bookmark < ActiveRecord::Base

  # one to many relationship for users table to bookmarks table
  belongs_to :user

  def self.all_bookmark_titles
    bookmarks = Bookmark.all

    display_titles = []
    bookmarks.each do |b|
      display_titles << "#{b.title}"
    end
  end

  # def 
  # end

end