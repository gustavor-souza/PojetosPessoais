class Category < ActiveRecord::Base
  belongs_to :system
  has_many :tickets

  validates :description, presence: true, length: { minimum: 5, maximum: 30 }
end
