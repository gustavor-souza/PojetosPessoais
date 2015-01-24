class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.datetime :finished_in
      t.references :System
      t.references :Subject
      t.references :Priority
      t.references :Status
      t.references :Company

      t.timestamps null: false
    end
    add_column :tickets, :created_by, :integer, references: :users
    add_column :tickets, :client_id, :integer, references: :users
    add_column :tickets, :analyst_id, :integer, references: :users

  end
end
