class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
  	@post = Post.new
  end

  def edit
    set_post
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def destroy
    set_post
    @post.destroy
    redirect_to action: 'index'
  end

  def show
    set_post
  end

  private

  def post_params
    params.require(:post).permit(:title,:body)
  end

  def set_post
    @post = Post.find(params[:id]);
  end
end
