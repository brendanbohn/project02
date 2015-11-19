class ChildrenController < ApplicationController
  def index
    @children = Child.all.order(:name)
    render :index
  end

  def show
    @child = Child.find_by_id(params[:id])
    @children=Child.all
    @user = User.find_by_id(@child.user_id)
    @current_user= current_user

  end

  def new
    @child = Child.new
    @user = User.find(current_user)
    render :new
  end

  def create
    child_params = params.require(:child).permit(:name, :birthday, :bio, :gender, :user_id)
    @child = Child.create(child_params)
    @current_user= current_user
    @child.user_id = @current_user.id
    if @child.save
      redirect_to @child # <-- go to child show
    else 
      render :new
    end
  end

  def edit
    @child = Child.find(params[:id])
    @user = User.find(current_user)
    render :edit
  end

  def update
    @child = Child.find(params[:id])
    child_params = params.require(:child).permit(:name, :birthday, :gender, :bio)
    @child.update_attributes(child_params)
    redirect_to @child
  end
end
