class UsersController < ApplicationController
  def index
    @users = User.all
    @children = Child.all
    @current_user= current_user
    render :index
  end

  def create
    @user = User.create( user_params )
  end

  def show
    @user = User.friendly.find(params[:id])
    @current_user= current_user
    @compatabilities = Compatability.all
    @questionnaires = Questionnaire.all
    @groups = Group.all
    @friendships = Friendship.all
    @users = User.all
    render :show
  end

  def new
    @user = User.new
    add_default_image @user
    render :new
  end

  def create
    user_params = params.require(:user).permit(:full_name, :city, :password, :email, :bio, :username, :image)
    @user = User.new(user_params)
    p params[:user][:email]

    add_default_image @user

    if @user.save
      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_now
      login(@user) # <-- login the user
      redirect_to new_questionnaire_path # <-- go to show
    else

      render :new
    end
  end


  def add_default_image user
    user.image = "5.png" if user.image.blank?
    user.save
  end


  def destroy
  end

  def edit
    @user = User.friendly.find(params[:id])
    add_default_image @user
    render :edit
  end

  def update          
    @user = User.friendly.find(params[:id])
    updated_attributes = params.require(:user).permit(:full_name, :username, :city, :bio, :image, :mission_statement)
    @user.update_attributes(updated_attributes)
    add_default_image @user
    redirect_to @user 
  end

  private
  
  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password)
  end

  def user_params
    params.require(:user).permit(:avatar)
  end

end
