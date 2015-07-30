#classe de modelo dos tickets
class Ticket < ActiveRecord::Base
  belongs_to :system
  belongs_to :category
  belongs_to :status
  belongs_to :priority

  belongs_to :incharge, class_name: :User
  belongs_to :creator,  class_name: :User

  has_many :comments

  scope :by_creator, ->(creator_id) { where(creator_id: creator_id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 600 }

  searchable do
    text :title, boost: 2
    text :description
    integer :creator_id
    integer :incharge_id
  end
end
