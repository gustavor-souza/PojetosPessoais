class Category < ActiveRecord::Base
  belongs_to :system
  has_many :tickets
end
