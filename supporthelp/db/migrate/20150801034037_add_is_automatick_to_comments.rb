class AddIsAutomatickToComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_automatic, :boolean, default: false
  end
end
