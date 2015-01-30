class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.timestamps null: false
    end
    add_column :comments, :ticket_id, :integer, references: :tickets
  end
end
