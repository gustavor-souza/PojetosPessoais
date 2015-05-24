class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { medium: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :incharge,  class_name: :Ticket, foreign_key: :incharge_id
  has_many :creator,   class_name: :Ticket, foreign_key: :creator_id

end
