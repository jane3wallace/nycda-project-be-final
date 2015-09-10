class BookmarksController < ApplicationController

	before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.all
  end

  def create
    bookmark = Bookmark.new
    bookmark.user_id = current_user.id
    bookmark.url = params[:bookmark][:url]
    bookmark.title = params[:bookmark][:title]
    bookmark.category = params[:bookmark][:category]
    bookmark.subcategory = params[:bookmark][:subcategory]
    bookmark.notes = params[:bookmark][:notes]
    if bookmark.save
      flash[:notice] = "Your bookmark was created!"
    else
      flash[:alert] = "Sorry, this bookmark was not created."
    end
    redirect_to bookmark_path(bookmark.id)
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    bookmark = Bookmark.find(params[:id])
    bookmark.url = params[:bookmark][:url]
    bookmark.title = params[:bookmark][:title]
    bookmark.category = params[:bookmark][:category]
    bookmark.subcategory = params[:bookmark][:subcategory]
    bookmark.notes = params[:bookmark][:notes]
    if bookmark.save
      flash[:notice] = "The bookmark was updated."
    else
      flash[:alert] = "This bookmark cannot be updated."
    end
    redirect_to bookmark_path(bookmark.id)
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    if bookmark.destroy
      flash[:notice] = "The bookmark was deleted."
    else
      flash[:alert] = "This bookmark cannot be deleted."
    end
    redirect_to bookmarks_path
  end

end