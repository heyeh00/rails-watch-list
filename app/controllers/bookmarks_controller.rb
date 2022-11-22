class BookmarksController < ApplicationController
  def new
    @movies = Movie.all
    @bookmark = Bookmark.new(list_id: params[:list_id].to_i)
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    if @bookmark
      redirect_to bookmark_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path, status: :see_other
  end

  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
