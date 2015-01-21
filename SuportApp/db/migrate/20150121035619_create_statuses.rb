class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title
      t.boolean :active

      t.timestamps null: false
    end
  end
end
