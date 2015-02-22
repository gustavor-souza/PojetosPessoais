class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
