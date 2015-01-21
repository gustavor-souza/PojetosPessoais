class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :User
      t.string :author_name
      t.references :Ticket

      t.timestamps null: false
    end
  end
end
