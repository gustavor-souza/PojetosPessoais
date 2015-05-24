class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :description, null: false, default: ""

      t.timestamps null: false
    end
  end
end
