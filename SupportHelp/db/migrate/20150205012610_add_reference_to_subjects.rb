class AddReferenceToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :system_id, :integer, references: :systems
  end
end
