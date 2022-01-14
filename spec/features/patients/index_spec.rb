require 'rails_helper'

RSpec.describe 'Patient index page' do

  it 'can show all patients from oldest to youngest' do

    hospital_1 = Hospital.create!(name: 'Hospital 1')
    hospital_2 = Hospital.create!(name: 'Hospital 2')

    doctor_1 = Doctor.create!(name: 'Doctor 1', specialty: 'Specialty 1', university: 'University 1', hospital_id: hospital_1.id)
    doctor_2 = Doctor.create!(name: 'Doctor 2', specialty: 'Specialty 2', university: 'University 2', hospital_id: hospital_1.id)
    doctor_3 = Doctor.create!(name: 'Doctor 3', specialty: 'Specialty 3', university: 'University 3', hospital_id: hospital_1.id)
    doctor_4 = Doctor.create!(name: 'Doctor 4', specialty: 'Specialty 4', university: 'University 3', hospital_id: hospital_1.id) # same hospital, repeat university
    doctor_5 = Doctor.create!(name: 'Doctor 5', specialty: 'Specialty 5', university: 'University 5', hospital_id: hospital_2.id) # different hospital

    patient_1 = Patient.create!(name: 'Patient 1', age: 21)
    patient_2 = Patient.create!(name: 'Patient 2', age: 22)
    patient_3 = Patient.create!(name: 'Patient 3', age: 23)
    patient_4 = Patient.create!(name: 'Patient 4', age: 24)

    dp_11 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)
    dp_12 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_2.id)
    dp_13 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_3.id)
    dp_24 = DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_4.id)

    visit "/patients"

    expect(page).to have_content("Patient 4, Patient 3, Patient 2, Patient 1")
  end

end
