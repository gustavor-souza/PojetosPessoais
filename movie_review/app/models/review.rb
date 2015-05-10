class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  scope :by_movie, -> (movie_id){where(movie_id: movie_id).order('created_at DESC')}
end
