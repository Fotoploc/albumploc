class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def albums
    @user = User.find(current_user.id)
    @albums = @user.albums.all
    @album_new = Album.new
  end

  def album
    @user = User.find(current_user.id)
    @album = Album.find(params[:album_id])
    @album_pages = @album.album_page.all
    @stickers = get_user_stickers_duplicate_by_album(@user, @album)
    @participants = @album.users.all.reject { |user| user.id == current_user.id || user.name == "Removed" }
  end

  def specific_user_albums
    @user = User.find(params[:user_id])
    @albums = @user.albums.all
  end

  def specific_user_album
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @stickers = get_user_stickers_duplicate_by_album(@user, @album)
    @stickers = @stickers.reject { |sticker| sticker.is_active == false }
    @participants = @album.users.all.reject { |user| user.id == current_user.id || user.name == "Removed" }
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      @album.users << current_user
      redirect_to albums_path
    else
      redirect_to albums_path.alert = 'Album creation failed'
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      redirect_to album_path(@album).alert = 'Album update failed'
    end
  end
  
  private
  def get_user_stickers_by_album(user, album)
    stickers_of_album = Sticker.where(album_id: album.id)
    user_active_stickers = user.stickers.where(is_active: true)
    stickers = []
    user_active_stickers.each do |userSticker|
      stickers_of_album.each do |sticker|
        sticker.id == userSticker.sticker_id ? stickers << sticker : nil
      end
    end
    stickers
  end

  def get_user_stickers_duplicate_by_album(user, album)
    stickers_of_album = Sticker.where(album_id: album.id)
    user_active_stickers = user.stickers.where("quantity > ?", 1)
    stickers = []
    user_active_stickers.each do |userSticker|
      stickers_of_album.each do |sticker|
        if sticker.id == userSticker.sticker_id
            stickers << sticker
        end
      end
    end
    stickers
  end
    
  def album_params
    params.require(:album).permit(:name, :description, :picture, :code)
  end
end
