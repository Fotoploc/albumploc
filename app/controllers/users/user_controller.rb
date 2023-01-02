class Users::UserController < ApplicationController
  before_action :authenticate_user!
  
  def all
    @users = User.all
  end

  def how_it_works
    
  end

  def profile
    @user = User.find(current_user.id)
    @albums = @user.albums.first(5)
    @stickers = []
    @user.stickers.last(5).each do |userSticker|
      @stickers << Sticker.find(userSticker.sticker_id)
    end
  end
end
