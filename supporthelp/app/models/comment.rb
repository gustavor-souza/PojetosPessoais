#classe de modelo dos comentários dos tickets
class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user

  validates :content, presence: true, length: { minimum: 5, maximum: 600 }
end
