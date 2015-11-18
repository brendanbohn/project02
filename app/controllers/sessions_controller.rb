class SessionsController < ApplicationController
	def new
	  @user = User.new
	  render :new
	end

	def create
	  @user = User.find_by(email: user_params[:email])
	  if @user && @user.authenticate(user_params[:password])
	    session[:user_id] = @user.id
	    login(@user) #login the user
	    redirect_to @user #go to show page for user
	  else
	    flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_path
	end

	private

	def user_params
	  params.require(:user).permit(:email, :password)
	end
end
