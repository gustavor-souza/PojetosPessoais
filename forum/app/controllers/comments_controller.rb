class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy, :update, :edit]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
