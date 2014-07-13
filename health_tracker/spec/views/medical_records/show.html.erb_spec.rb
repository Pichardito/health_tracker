require 'rails_helper'

RSpec.describe "medical_records/show", :type => :view do
  before(:each) do
    @medical_record = assign(:medical_record, MedicalRecord.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
  end
end
