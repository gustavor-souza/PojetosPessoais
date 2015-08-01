#classe de modelo dos tickets
class Ticket < ActiveRecord::Base
  belongs_to :system
  belongs_to :category
  belongs_to :status
  belongs_to :priority

  belongs_to :incharge, class_name: :User
  belongs_to :creator,  class_name: :User

  has_many :comments

  scope :by_creator, ->(creator_id) { where(creator_id: creator_id) }

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 600 }

  searchable do
    text :title, boost: 2
    text :description
    integer :creator_id
    integer :incharge_id
  end

  def cancel_or_finish(commit)
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
  end

  def define_waiting_status
    self.status_id = Status.select(:id).where(is_waiting: true).pluck(:id).first
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
end
