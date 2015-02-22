class User < ActiveRecord::Base
  has_many :tickets
  has_many :comments
  belongs_to :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :name, presence: true, length: {minimum: 2, maximum: 70}
  validates :ddd, presence: true, length: {minimum: 2, maximum: 2}
  validates :phone, presence: true, length: {minimum: 8, maximum: 9}

  def analyst?
    return is_analyst
  end

end
