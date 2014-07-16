class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :weight
      t.integer :triglycerides
      t.integer :glycated_hemoglobin
      t.integer :cholesterol
      t.integer :systolic
      t.integer :diastolic
      t.integer :height
      t.integer :bmi

      t.timestamps
    end
  end
end
