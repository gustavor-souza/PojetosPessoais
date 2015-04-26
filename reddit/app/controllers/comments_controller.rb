class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    respond_with(@link)

  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end
end
