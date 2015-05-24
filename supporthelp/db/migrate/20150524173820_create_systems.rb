class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :description, null: false, default: ""

      t.timestamps null: false
    end
  end
end
