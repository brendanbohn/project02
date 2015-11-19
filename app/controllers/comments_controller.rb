class CommentsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.find_by_id(params[@post.comment_id])
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:response, :post_id)
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
end
