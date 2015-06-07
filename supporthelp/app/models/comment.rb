#classe de modelo dos comentários dos tickets
class Comment < ActiveRecord::Base
  belongs_to :ticket

  validates :content, presence: true, length: { minimum: 5, maximum: 600 }
end
