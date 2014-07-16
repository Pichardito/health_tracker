class ChangeOtherColumnTypeInMedicalRecords < ActiveRecord::Migration
  def change
  	change_column :records, :triglycerides, :float
  	change_column :records, :glycated_hemoglobin, :float
  	change_column :records, :cholesterol, :float
  	change_column :records, :height, :float
  	change_column :records, :bmi, :float

  end
end
