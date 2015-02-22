class Priority < ActiveRecord::Base
  has_many :tickets
  scope :actives, -> { where(is_active: true)}
  validates :description, presence: true, length: { minimum: 1, maximum:35 }
end
