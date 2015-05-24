class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
		@posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update_attributes(post_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to :root
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:link,:description)
  end
end
