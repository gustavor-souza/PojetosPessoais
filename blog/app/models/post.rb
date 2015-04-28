class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}, format: {without: /gustavo/}
  validates :title, presence: true
end
