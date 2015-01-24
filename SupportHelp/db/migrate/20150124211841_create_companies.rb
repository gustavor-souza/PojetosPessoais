class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.boolean :is_active

      t.timestamps null: false
    end
    add_column :users, :company_id, :integer, references: :companies
  end
end
