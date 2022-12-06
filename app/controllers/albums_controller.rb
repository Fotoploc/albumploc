class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def albums
    @user = User.find(current_user.id)
    @albums = @user.albums.all
  end

  def album
    @user = User.find(current_user.id)
    @album = Album.find(params[:album_id])
    @stickers = @stickers = get_user_stickers_by_album(@user, @album)
    @participants = @album.users.all.reject { |user| user.id == current_user.id }
  end

  def specific_user_albums
    @user = User.find(params[:user_id])
    @albums = @user.albums.all
  end

  def specific_user_album
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @stickers = get_user_stickers_by_album(@user, @album)
    @stickers = @stickers.reject { |sticker| sticker.is_active == false }
    @participants = @album.users.all.reject { |user| user.id == current_user.id }
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
end
