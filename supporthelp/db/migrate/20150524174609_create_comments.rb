class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false, default: ""
      t.references :ticket, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :tickets
  end
end
