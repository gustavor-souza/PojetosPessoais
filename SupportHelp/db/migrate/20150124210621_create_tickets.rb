class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.datetime :finished_in
      t.references :system
      t.references :subject
      t.references :priority
      t.references :status
      t.references :company

      t.timestamps null: false
    end
    add_column :tickets, :created_by, :integer, references: :users
    add_column :tickets, :client_id, :integer, references: :users
    add_column :tickets, :analyst_id, :integer, references: :users
    add_column :tickets, :system_id, :integer, references: :systems
    add_column :tickets, :status_id, :integer, references: :statuses
    add_column :tickets, :priority_id, :integer, references: :Priorities

  end
end
