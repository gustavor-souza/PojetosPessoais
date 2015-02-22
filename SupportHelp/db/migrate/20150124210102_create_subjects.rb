class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
