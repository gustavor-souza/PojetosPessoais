class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :copy_to
      t.boolean :active
      t.references :Client
      t.references :Admin
      t.references :subjects
      t.references :systems
      t.references :status

      t.timestamps null: false
    end
  end
end
