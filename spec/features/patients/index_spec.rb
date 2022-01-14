require 'rails_helper'

describe 'patients index page' do
  it "lists all patients from oldest to youngest" do
    @patient_1 = Patient.create!(name: 'patient_1', age: 20)
    @patient_2 = Patient.create!(name: 'patient_2', age: 44)
    @patient_3 = Patient.create!(name: 'patient_3', age: 22)

    visit "/patients"

    expect(@patient_2.name).to appear_before(@patient_3.name)
    expect(@patient_3.name).to appear_before(@patient_1.name)
  end
end
