class PostsController < ApplicationController
  include SessionsHelper
  
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(@post.user_id)
    @group = Group.find_by_id(@post.group_id)
    @groups = Group.all
    render :show
  end

  def new
    @post = Post.new
    @groups = Group.all
    @user = User.find(current_user)
    @current_user= current_user

    render :new
  end

  def create
    post_params = params.require(:post).permit(:title, :author, :content, :user_id, :group_id)
    @post = Post.create(post_params)
    @current_user= current_user
    @groups = Group.all
    @post.user_id = @current_user.id
    if @post.save
      redirect_to @post 
    else 
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(current_user)
    @groups = Group.all
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    post_params = params.require(:post).permit(:title, :content)
    @post.update_attributes(post_params)
    @groups = Group.all
    redirect_to @post
  end

  def destroy
    @user = User.find(current_user)
    Post.destroy(params[:id])
    @groups = Group.all
    redirect_to @user
  end
end
