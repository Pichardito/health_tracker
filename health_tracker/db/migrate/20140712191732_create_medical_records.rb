class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|

    	t.integer :patient_id
    	t.integer :doctor_id

    	t.text :notes
    	t.integer :weight

      	t.timestamps
    end
  end
end
