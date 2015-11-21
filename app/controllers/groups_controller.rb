class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(:name)
    render :index
  end

  def show
    @group = Group.find(params[:id])
    @groups = Group.all
    @posts = Post.where(group_id: @group).order(created_at: :DESC)
    @user = User.friendly.find(params[:id])
    @current_user= current_user
    @post = Post.new
    @memberships = Membership.all
    @membership = Membership.new
    render :show
  end

  def new
    @group = Group.new
    @current_user= current_user
    @users = User.all
    @membership.user_id = current_user.id
    render :new
  end

  def create
    group_params = params.require(:group).permit(:name, :description)
    @group = Group.create(group_params)
    @current_user= current_user
    @users = User.all
    @memberships.user_id = current_user.id
     if @group.save
      redirect_to @group
    else 
      render :new
    end
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
