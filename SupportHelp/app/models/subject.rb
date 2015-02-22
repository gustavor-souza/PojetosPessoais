class Subject < ActiveRecord::Base
  belongs_to :system
  scope :actives, -> { where(is_active: true)}
  scope :filter_system, ->(sys_id) { where(system_id: sys_id)}

  validates :title, presence: true, length: { minimum: 1, maximum:90 }  
end
