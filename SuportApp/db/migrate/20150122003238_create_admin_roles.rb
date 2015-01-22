class CreateAdminRoles < ActiveRecord::Migration
  def change
    create_table :admin_roles do |t|
      t.references :user, index: true
      t.boolean :master
      t.boolean :active
      t.timestamps null: false
    end
    add_foreign_key :admin_roles, :users
  end
end
