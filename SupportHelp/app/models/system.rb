class System < ActiveRecord::Base
  has_many :subjects
  has_many :tickets
  scope :actives, -> { where(is_active: true)}

  validates :name, presence: true, length: {minimum: 1, maximum: 50}

end
