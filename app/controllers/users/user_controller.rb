class Users::UserController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def all
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
  end

  def stickers
    @stickers = @user_sticker.where(user_id: current_user.id)
  end

end
