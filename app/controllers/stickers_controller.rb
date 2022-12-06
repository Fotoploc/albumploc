class StickersController < ApplicationController
  def stickers
    @user = User.find(current_user.id)
    @stickers = []
    @user.stickers.each do |userSticker|
      @stickers << Sticker.find(userSticker.id)
    end
  end
end
