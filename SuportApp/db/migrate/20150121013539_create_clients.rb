class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :ddd
      t.references :users
      t.boolean :active

      t.timestamps null: false
    end
  end
end
