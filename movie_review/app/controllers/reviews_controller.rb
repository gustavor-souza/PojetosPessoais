class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_movie, only: [:create, :new]
  before_action :authenticate_user!
  respond_to :html

  def new
    @review = @movie.reviews.build
  end

  def edit
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @movie, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to :back
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
