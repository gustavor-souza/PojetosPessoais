class AddInChargeAndUserIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :creator_id, :integer
    add_column :tickets, :incharge_id, :integer

    add_index :tickets, :creator_id
    add_index :tickets, :incharge_id
  end
end
