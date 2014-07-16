class ChangeColumnTypeInMedicalRecords < ActiveRecord::Migration
  def change
  	change_column :records, :weight, :float
  end
end
