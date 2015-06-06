class Company < ActiveRecord::Base
  has_many :users

  validates :name, presence: true, length: { minimum: 5, maximum: 80 }
  validates :cnpj, cnpj: true
end
