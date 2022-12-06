class Users::UserController < ApplicationController
  before_action :authenticate_user!
  
  def all
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
    @albums = @user.albums.first(5)
    @stickers = []
    @user.stickers.first(5).each do |userSticker|
      @stickers << Sticker.find(userSticker.id)
    end
  end

  def stickers
    @user = User.find(current_user.id)
    @stickers = []
    @user.stickers.each do |userSticker|
      @stickers << Sticker.find(userSticker.id)
    end
  end
end
