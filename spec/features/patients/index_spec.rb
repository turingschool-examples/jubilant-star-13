require 'rails_helper'

RSpec.describe "Patient Index Page" do
  before(:each) do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doctor_1 = @hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @patient_1 = Patient.create!(name: "George O'Malley", age: 35)
    @patient_2 = Patient.create!(name: "Mark Zuckerburg", age: 45)
    @patient_3 = Patient.create!(name: "Jeremy Johnson", age: 23)
    @patient_4 = Patient.create!(name: "Miranda Lambert", age: 40)

    @doctor_1.patients << @patient_1
    @doctor_1.patients << @patient_2
    @doctor_1.patients << @patient_3

    visit patients_path
  end

  scenario "visitor sees the names of all patients listed from oldest to youngest" do
    expect(@patient_2.name).to appear_before(@patient_4.name)
    expect(@patient_4.name).to appear_before(@patient_1.name)
    expect(@patient_1.name).to appear_before(@patient_3.name)
  end

  scenario "visitor removes patient from a doctors care, but patient record is not deleted" do
    expect(page).to have_content(@patient_1.name)

    visit doctor_path(@doctor_1.id)
    expect(page).to have_content(@patient_1.name)

    within "#patient-#{@patient_1.id}" do
      click_button "Remove #{@patient_1.name}"
    end

    visit patients_path
    expect(page).to have_content(@patient_1.name)
  end
end
