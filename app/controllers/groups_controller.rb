class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(:name)
    render :index
  end

  def show
    p params[:id]
    @group = Group.find(params[:id])
    @groups = Group.all
    @posts = Post.where(group_id: @group).order(created_at: :DESC)
    @user = User.all
    @current_user= current_user
    @post = Post.new
    @memberships = Membership.all
    @membership = Membership.new
    @event = Event.new
    @events = Event.where(group_id: @group).order(date: :DESC)

    
    
    render :show
  end

  def new
    @group = Group.new
    @current_user= current_user
    @users = User.all
    @membership = Membership.new
    render :new
  end

  def create
    group_params = params.require(:group).permit(:name, :description)
    @group = Group.new(group_params)

    @current_user= current_user
    @users = User.all
    if @group.save
      create_member @current_user.id, @group.id
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
    @membership = Membership.new
    @group = Group.find(params[:id])
    render :edit
  end

  def update          
    @group = Group.find(params[:id])
    updated_attributes = params.require(:group).permit(:name, :description, :members)
    @group.update_attributes(updated_attributes)
    redirect_to @group
  end

  def create_member user_id, group_id
    Membership.create(user_id: user_id, group_id: group_id)
  end

end
