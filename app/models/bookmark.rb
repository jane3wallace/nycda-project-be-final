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

  def self.current_user_titles
    bookmarks = current_user.bookmarks

    current_user_list = []
    bookmarks.each do |b|
      if b.user_id == current_user.id
        current_user_list << "#{b.title}"
      end
    end 
  end

end