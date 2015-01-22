class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.boolean :active
      t.references :system, index: true

      t.timestamps null: false
    end
    add_foreign_key :subjects, :systems

  end
end
