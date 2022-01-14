require 'rails_helper'

# User Story 3, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
#
# NOTE: the patient record should not be deleted entirely

RSpec.describe 'the Doctor show page', type: :feature do


  it 'shows doctor attributes' do
    hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    doctor = hospital.doctors.create!(name: 'Joe Schmoe', specialty: 'General Surgery', university: "Stanford University")

    patient_1 = Patient.create!(name: 'Jane Schmoe', age: 28)
    patient_2 = Patient.create!(name: 'Moe Howard', age: 48)
    patient_3 = Patient.create!(name: 'James Smith', age: 48)

    doctor.patients << patient_1
    doctor.patients << patient_2

    visit hospital_doctor_path(hospital, doctor)

    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.specialty)
    expect(page).to have_content(doctor.university)
    expect(page).to have_content(hospital.name)
  end

  it 'lists all of the doctors patients' do
    hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    doctor = hospital.doctors.create!(name: 'Joe Schmoe', specialty: 'General Surgery', university: "Stanford University")

    patient_1 = Patient.create!(name: 'Jane Schmoe', age: 28)
    patient_2 = Patient.create!(name: 'Moe Howard', age: 48)
    patient_3 = Patient.create!(name: 'James Smith', age: 48)

    doctor.patients << patient_1
    doctor.patients << patient_2

    visit hospital_doctor_path(hospital, doctor)
    visit hospital_doctor_path(hospital, doctor)
    expect(page).to have_content(patient_1.name)
    expect(page).to have_content(patient_2.name)
    expect(page).to_not have_content(patient_3.name)
  end

# describe 'removing patients' do
#   xit "removes a patient from caseload" do
#     hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
#     doctor = hospital.doctors.create!(name: 'Joe Schmoe', specialty: 'General Surgery', university: "Stanford University")
#
#     patient_1 = Patient.create!(name: 'Jane Schmoe', age: 28)
#     patient_2 = Patient.create!(name: 'Moe Howard', age: 48)
#     patient_3 = Patient.create!(name: 'James Smith', age: 48)
#
#     doctor.patients << patient_1
#
#
#     visit hospital_doctor_path(hospital, doctor)
#     click_button 'Remove'
#     expect(page).to_not have_content(patient_1.name)
#   end
#   end
end
