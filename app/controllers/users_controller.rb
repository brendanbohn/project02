class UsersController < ApplicationController
  def index
    @users = User.all
    @children = Child.all
    render :index
  end

  def show
    @user = User.friendly.find(params[:id])
    @current_user= current_user

    render :show
  end

  def new
    @user = User.new
    # add_default_image @user
    render :new
  end

  def create
    user_params = params.require(:user).permit(:full_name, :city, :password, :email, :bio, :username, :image)
    @user = User.new(user_params)
    p params[:user][:email]

    # @user.add_default_image

    if @user.save
     login(@user) # <-- login the user
     redirect_to user_path(@user) # <-- go to show
    else
      render :new
    end
  end

  def destroy
  end

  def edit
    @user = User.friendly.find(params[:id])
    # add_default_image @user
    render :edit
  end

  def update          
    @user = User.friendly.find(params[:id])
    updated_attributes = params.require(:user).permit(:full_name, :username, :city, :bio, :image)
    @user.update_attributes(updated_attributes)
    # @user.add_default_image
    redirect_to @user 
  end

  private
    def user_params
    params.require(:user).permit(:fullname, :username, :email, :password)
  end

end
