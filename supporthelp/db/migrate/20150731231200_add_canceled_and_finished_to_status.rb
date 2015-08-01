class AddCanceledAndFinishedToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :is_canceled, :boolean, default: false
    add_column :statuses, :is_finished, :boolean, default: false
  end
end
