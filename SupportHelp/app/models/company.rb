class Company < ActiveRecord::Base
  has_many :users
  has_many :tickets

  scope :actives, -> {where(is_active: true)}
  validates :title, presence: true, length: { minimum: 3, maximum:70 }
end
