#classe de modelo do sistema de uma categoria
class System < ActiveRecord::Base
  has_many :tickets

  validates :description, presence: true, length: { minimum: 1, maximum: 15 }
end
