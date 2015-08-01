#classe de modelo dos usuários - criado via devise e modificado
#conforme as necessidades do projeto
class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { medium: "100x100" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :incharge,  class_name: :Ticket, foreign_key: :incharge_id
  has_many :creator,   class_name: :Ticket, foreign_key: :creator_id
  has_many :comments

  validates :ddd, presence: true, length: { is: 2 }
  validates :phone, presence: true, length: { minimum: 8, maximum: 9 }
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }

  def attendant?
    is_attendant
  end
end
