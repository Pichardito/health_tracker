class AddNewColumnToRecords < ActiveRecord::Migration
  def change
  	add_column :records, :patient_name, :string
  end
end
