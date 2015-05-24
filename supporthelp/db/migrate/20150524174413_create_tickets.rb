class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.references :system, index: true
      t.references :category, index: true
      t.references :status, index: true
      t.references :priority, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :systems
    add_foreign_key :tickets, :categories
    add_foreign_key :tickets, :statuses
    add_foreign_key :tickets, :priorities
  end
end
