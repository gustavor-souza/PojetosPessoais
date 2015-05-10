class TodoItem < ActiveRecord::Base
  belongs_to :todo

  def completed?
    !completed_at.blank?
  end
end
