class AddPhoneToUser < ActiveRecord::Migration
  def change
    remove_column :users, :telefone
    add_column :users, :phone, :string
  end
end
