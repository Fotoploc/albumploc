class Users::UserController < ApplicationController
  before_action :authenticate_user!
  
  def all
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
    @albums = @user.albums.first(5)
    @stickers = @user.stickers.first(5)
  end

  def stickers
    @user = User.find(current_user.id)
    @stickers = @user.stickers.all
  end

  def albums
    @user = User.find(current_user.id)
    @albums = @user.albums.all
  end

  def album
    @user = User.find(current_user.id)
    @album = Album.find(params[:id])
    @stickers = @album.stickers.all
    @participants = @album.users.all.reject { |user| user.id == current_user.id }
  end
end
