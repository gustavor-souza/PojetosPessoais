#classe de modelo do status de um ticket
class Status < ActiveRecord::Base
  has_many :tickets

  validates :description, presence: true, length: { minimum: 1, maximum: 50 }

  scope :waiting, -> { where(is_waiting: true).first }
  scope :waiting_for_user, -> { where(is_waiting_for_user: true).first }
  scope :open, -> { where(is_open: true).first }
end
