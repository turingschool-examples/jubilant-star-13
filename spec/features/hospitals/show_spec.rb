require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  before(:each) do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "St. Mary's Hospital")

    @doctor_1 = @hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor_2 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "Cardiology", university: "Johns Hopkins")
    @doctor_3 = @hospital_1.doctors.create!(name: "Dereck Shepherd", specialty: "Neurosurgery", university: "Johns Hopkins")
    @doctor_4 = @hospital_2.doctors.create!(name: "Christina Yang", specialty: "Primary Care", university: "Johns Hopkins")
    @doctor_5 = @hospital_2.doctors.create!(name: "Alex Kirev", specialty: "Orthopedics", university: "UCLA")

    @patient_1 = Patient.create!(name: "George O'Malley", age: 35)
    @patient_2 = Patient.create!(name: "Mark Zuckerburg", age: 45)
    @patient_3 = Patient.create!(name: "Jeremy Johnson", age: 23)
    @patient_4 = Patient.create!(name: "Miranda Lambert", age: 40)

    @doctor_1.patients << @patient_1
    @doctor_1.patients << @patient_2
    @doctor_1.patients << @patient_3

    visit hospital_path(@hospital_1.id)
  end

  scenario 'visitor sees the hospital name' do
    expect(page).to have_content(@hospital_1.name)
    expect(page).to_not have_content(@hospital_2.name)
  end

  scenario 'visitor sees the number of doctors that work there' do
    expect(page).to have_content(@hospital_1.total_doctors)
  end

  scenario 'visitor sees a unique list of unviersities that its doctors attended' do
    expect(page).to have_content("Stanford University")
    expect(page).to have_content("Johns Hopkins")
    save_and_open_page
  end
end
