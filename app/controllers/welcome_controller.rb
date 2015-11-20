class WelcomeController < ApplicationController
  def index
  	@user = User.new
  	@welcomepg = true
  	@current_user= current_user
  end
end
