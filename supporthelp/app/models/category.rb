#classe de modelo de categoria
class Category < ActiveRecord::Base
  belongs_to :system
  has_many :tickets

  scope :by_system, ->(system_id) { where(system_id: system_id) }

  validates :description, presence: true, length: { minimum: 5, maximum: 30 }
end
