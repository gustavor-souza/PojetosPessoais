class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :description, null: false, default: ""

      t.timestamps null: false
    end
  end
end
