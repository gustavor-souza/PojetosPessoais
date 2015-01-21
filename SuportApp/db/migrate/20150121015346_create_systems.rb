class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :title
      t.boolean :active
      t.timestamps null: false
    end
  end
end
