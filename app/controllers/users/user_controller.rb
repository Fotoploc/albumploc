class Users::UserController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def all
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
  end

  def stickers
    @user = User.find(current_user.id)
    @stickers = @user.stickers.all
  end

  def albums
    @user = User.find(current_user.id)
    @albums = @user.albums.all
  end
end
