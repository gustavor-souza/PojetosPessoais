class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.boolean :is_active
      t.references :System

      t.timestamps null: false
    end
  end
end
