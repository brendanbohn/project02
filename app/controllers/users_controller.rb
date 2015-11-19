class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
    render :index
  end

  def show
    @user = User.find(params[:id])
    @current_user= current_user
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:full_name, :city, :password, :email, :bio, :username)
    @user = User.new(user_params)
    if @user.save
     sesssion[:user_id]=user.id # <-- login the user
     redirect_to user_path(@user) # <-- go to show
    else
      render :new
    end
  end

  def destroy
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update          
    @user = User.find(params[:id])
    updated_attributes = params.require(:user).permit(:full_name, :username, :city, :bio)
    @user.update_attributes(updated_attributes)
    redirect_to @user 
  end

  private
    def user_params
    params.require(:user).permit(:fullname, :username, :email, :password)
  end

end
