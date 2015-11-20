class WelcomeController < ApplicationController
  def index
  	@user = User.new
  	@welcomepg = true
  end
end
