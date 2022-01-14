require 'rails_helper'

RSpec.describe 'Doctors Show Page' do

  before(:each) do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @doctor_1 = @hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor_2 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "Cardiology", university: "UCLA")
    @doctor_3 = @hospital_1.doctors.create!(name: "Dereck Shepherd", specialty: "Neurosurgery", university: "Johns Hopkins")

    @patient_1 = Patient.create!(name: "George O'Malley", age: 35)
    @patient_2 = Patient.create!(name: "Mark Zuckerburg", age: 45)
    @patient_3 = Patient.create!(name: "Jeremy Johnson", age: 23)
    @patient_4 = Patient.create!(name: "Miranda Lambert", age: 40)

    @doctor_1.patients << @patient_1
    @doctor_1.patients << @patient_2
    @doctor_1.patients << @patient_3

    visit doctor_path(@doctor_1)
  end

  scenario 'visitor sees all doctors information' do
    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)

    expect(page).to_not have_content(@doctor_2.name)
    expect(page).to_not have_content(@doctor_2.specialty)
    expect(page).to_not have_content(@doctor_2.university)

    expect(page).to_not have_content(@doctor_3.name)
    expect(page).to_not have_content(@doctor_3.specialty)
    expect(page).to_not have_content(@doctor_3.university)
  end

  scenario 'visitor sees name of hospital where doctor works' do
    expect(page).to have_content(@hospital_1.name)
  end

  scenario 'visitor sees names of all patients associated with doctor' do
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_3.name)
    expect(page).to_not have_content(@patient_4.name)
  end
end
