class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(:name)
    render :index
  end

  def show
    @group = Group.find(params[:id])
    @groups = Group.all
    @posts = Post.where(group_id: @group).order(created_at: :DESC)
    @user = User.find(params[:id])
    @current_user= current_user
    @post = Post.new
    render :show
  end

  def new
    @group = Group.new
    render :new
  end

  def create
    group_params = params.require(:group).permit(:name, :description, :members)
    @group = Group.create(group_params)
    redirect_to @group
  end

  def destroy
    @user = User.find(current_user)
    Group.destroy(params[:id])
    redirect_to @user
  end

  def edit
    @group = Group.find(params[:id])
    render :edit
  end

  def update          
    @group = Group.find(params[:id])
    updated_attributes = params.require(:group).permit(:name, :description, :members)
    @group.update_attributes(updated_attributes)
    redirect_to @group
  end
end
