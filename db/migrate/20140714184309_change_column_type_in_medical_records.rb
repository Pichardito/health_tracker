class ChangeColumnTypeInMedicalRecords < ActiveRecord::Migration
  def change
  	change_column :medical_records, :weight, :float
  end
end
