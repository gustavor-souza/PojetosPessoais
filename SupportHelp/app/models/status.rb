class Status < ActiveRecord::Base
  has_many :ticketss
  scope :actives, ->{where(is_active: true)}

  validates :name, presence: true, length: { minimum: 1, maximum:35 }
end
