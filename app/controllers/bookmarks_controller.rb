class BookmarksController < ApplicationController

	before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    bookmark = Bookmark.new
    bookmark.title = params[:bookmark][:title]
    bookmark.url = params[:bookmark][:url]
    bookmark.user_id = current_user.id
    if bookmark.save
      flash[:notice] = "Your bookmark was created!"
    else
      flash[:alert] = "Sorry, this bookmark was not created."
    end
    redirect_to bookmark_path(bookmark.id)
  end

  def destroy
    bookmark = bookmark.find(params[:id])
    if bookmark.destroy
      flash[:notice] = "The bookmark was deleted."
    else
      flash[:alert] = "This bookmark cannot be deleted."
    end
    redirect_to bookmarks_path
  end

end