#classe de modelo dos tickets
class Ticket < ActiveRecord::Base
  include TicketUtil

  belongs_to :system
  belongs_to :category
  belongs_to :status
  belongs_to :priority

  belongs_to :incharge, class_name: :User
  belongs_to :creator,  class_name: :User

  delegate :name, :phone, :ddd, :email, :to => :creator,  :prefix => true
  delegate :name, :phone, :ddd, :email, :to => :incharge, :prefix => true
  delegate :description,                :to => :status,   :prefix => true
  delegate :description,                :to => :system,   :prefix => true
  delegate :description,                :to => :priority, :prefix => true
  delegate :description,                :to => :category, :prefix => true

  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 600 }

  searchable do
    text :title, boost: 2
    text :description
    integer :creator_id
    integer :incharge_id
    integer :status_id
  end

  def canceled_or_finished?
    self.finished? || self.canceled?
  end

  def finished?
    self.status.is_finished
  end

  def canceled?
    self.status.is_canceled
  end

  def define_open_status_and_save
    self.status = Status.open
    self.save
  end

  def define_waiting_status
    self.status = Status.waiting
  end
end
