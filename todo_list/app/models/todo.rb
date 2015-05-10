class Todo < ActiveRecord::Base
  has_many :todo_items
end
