class AddIsAttendantToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_attendant, :boolean
  end
end
