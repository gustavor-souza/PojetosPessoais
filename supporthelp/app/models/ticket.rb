#classe de modelo dos tickets
class Ticket < ActiveRecord::Base
  belongs_to :system
  belongs_to :category
  belongs_to :status
  belongs_to :priority

  belongs_to :incharge, class_name: :User
  belongs_to :creator,  class_name: :User

  has_many :comments

  scope :by_status, ->(status_id) { where(status_id: status_id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 600 }

  searchable do
    text :title, boost: 2
    text :description
    integer :creator_id
    integer :incharge_id
    integer :status_id
  end

  def cancel_or_finish(msg, user_id, commit)
    cancel = false
    finish = false

    if commit == 'Cancelar'
      cancel = true
    elsif commit == 'Encerrar'
      finish = true
    end
    #define o status e a menságem ao usuário
    #select + pluck melhora a performance da consulta
    self.status_id = Status.select(:id).where(is_finished: finish,
     is_canceled: cancel).pluck(:id).first

    self.create_automatic_comment_and_save(msg, user_id)
  end

  def canceled_or_finished?
    self.status.is_canceled || self.status.is_finished
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

  def create_automatic_comment_and_save(message, user_id)
    self.comments.build(content: message, user_id: user_id, is_automatic: true )
    self.save
  end
end
