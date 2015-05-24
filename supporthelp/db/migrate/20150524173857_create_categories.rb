class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description, null: false, default: ""
      t.references :system, index: true

      t.timestamps null: false
    end
    add_foreign_key :categories, :systems
  end
end
