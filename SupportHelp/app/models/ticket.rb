class Ticket < ActiveRecord::Base
  belongs_to :system
  belongs_to :subject
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :analyst, class_name: "User", foreign_key: "analyst_id"
  belongs_to :status
  belongs_to :priority
  has_many :comments

  scope :by_user, -> (client_id){where(client_id: client_id )}

  validates :title, presence: true, length: {minimum: 1, maximum: 60}

  accepts_nested_attributes_for :comments
end
