require 'rails_helper'

RSpec.describe "medical_records/new", :type => :view do
  before(:each) do
    assign(:medical_record, MedicalRecord.new(
      :patient_id => 1,
      :doctor_id => 1,
      :weight => 1,
      :triglycerides => 1,
      :glycated_hemoglobin => 1,
      :cholesterol => 1,
      :systolic => 1,
      :diastolic => 1,
      :height => 1,
      :bmi => 1
    ))
  end

  it "renders new medical_record form" do
    render

    assert_select "form[action=?][method=?]", medical_records_path, "post" do

      assert_select "input#medical_record_patient_id[name=?]", "medical_record[patient_id]"

      assert_select "input#medical_record_doctor_id[name=?]", "medical_record[doctor_id]"

      assert_select "input#medical_record_weight[name=?]", "medical_record[weight]"

      assert_select "input#medical_record_triglycerides[name=?]", "medical_record[triglycerides]"

      assert_select "input#medical_record_glycated_hemoglobin[name=?]", "medical_record[glycated_hemoglobin]"

      assert_select "input#medical_record_cholesterol[name=?]", "medical_record[cholesterol]"

      assert_select "input#medical_record_systolic[name=?]", "medical_record[systolic]"

      assert_select "input#medical_record_diastolic[name=?]", "medical_record[diastolic]"

      assert_select "input#medical_record_height[name=?]", "medical_record[height]"

      assert_select "input#medical_record_bmi[name=?]", "medical_record[bmi]"
    end
  end
end
