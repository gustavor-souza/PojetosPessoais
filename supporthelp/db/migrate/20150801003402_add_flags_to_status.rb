class AddFlagsToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :is_waiting_for_user, :boolean, default: false
    add_column :statuses, :is_waiting,          :boolean, default: false
    add_column :statuses, :is_open,              :boolean, default: false
  end
end
