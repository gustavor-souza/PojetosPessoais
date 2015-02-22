class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user

  validates  :content, presence: true, length: { minimum: 3, maximum:500}
end
