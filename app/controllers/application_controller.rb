class ApplicationController < ActionController::Base
  #Devise layout for login
  def new
    layout "devise"
    super
  end

end
