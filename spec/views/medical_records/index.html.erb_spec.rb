require 'rails_helper'

RSpec.describe "medical_records/index", :type => :view do
  before(:each) do
    assign(:medical_records, [
      MedicalRecord.create!(
        :patient_id => 1,
        :doctor_id => 2,
        :weight => 3,
        :triglycerides => 4,
        :glycated_hemoglobin => 5,
        :cholesterol => 6,
        :systolic => 7,
        :diastolic => 8,
        :height => 9,
        :bmi => 10
      ),
      MedicalRecord.create!(
        :patient_id => 1,
        :doctor_id => 2,
        :weight => 3,
        :triglycerides => 4,
        :glycated_hemoglobin => 5,
        :cholesterol => 6,
        :systolic => 7,
        :diastolic => 8,
        :height => 9,
        :bmi => 10
      )
    ])
  end

  it "renders a list of medical_records" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
  end
end
