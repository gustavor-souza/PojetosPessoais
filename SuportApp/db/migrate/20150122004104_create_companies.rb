class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.boolean :active
      t.timestamps null: false
    end

    add_foreign_key :users, :companies
    add_foreign_key :tickets, :subjects
    add_foreign_key :tickets, :systems
    add_foreign_key :tickets, :statuses
  end
end
