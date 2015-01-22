class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :status

  has_many :comments
end
