class ChangeOtherColumnTypeInMedicalRecords < ActiveRecord::Migration
  def change
  	change_column :medical_records, :triglycerides, :float
  	change_column :medical_records, :glycated_hemoglobin, :float
  	change_column :medical_records, :cholesterol, :float
  	change_column :medical_records, :height, :float
  	change_column :medical_records, :bmi, :float

  end
end
