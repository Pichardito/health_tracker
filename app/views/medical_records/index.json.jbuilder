json.array!(@medical_records) do |medical_record|
  json.extract! medical_record, :id, :patient_id, :doctor_id, :weight, :triglycerides, :glycated_hemoglobin, :cholesterol, :systolic, :diastolic, :height, :bmi
  json.url medical_record_url(medical_record, format: :json)
end
