class RemovePatientIdAndDoctorIdFromRecords < ActiveRecord::Migration
  def change
  	remove_column :records, :patient_id, :integer
  	remove_column :records, :doctor_id, :integer
  end
end
