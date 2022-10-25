class UserController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def all
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
  end

end
