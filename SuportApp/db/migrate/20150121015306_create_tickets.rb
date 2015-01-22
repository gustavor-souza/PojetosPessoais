class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :copy_to
      t.boolean :active
      t.references :user, index: true
      t.references :subject, index: true
      t.references :system, index: true
      t.references :status, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :users
  end
end
