require 'rails_helper'

RSpec.describe 'Doctor show page' do

  it 'can show all information about one doctor' do

    hospital_1 = Hospital.create!(name: 'Hospital 1')
    hospital_2 = Hospital.create!(name: 'Hospital 2')

    doctor_1 = Doctor.create!(name: 'Doctor 1', specialty: 'Specialty 1', university: 'University 1', hospital_id: hospital_1.id)
    doctor_2 = Doctor.create!(name: 'Doctor 2', specialty: 'Specialty 2', university: 'University 2', hospital_id: hospital_1.id)
    doctor_3 = Doctor.create!(name: 'Doctor 3', specialty: 'Specialty 3', university: 'University 3', hospital_id: hospital_1.id)

    patient_1 = Patient.create!(name: 'Patient 1', age: 21)
    patient_2 = Patient.create!(name: 'Patient 2', age: 22)
    patient_3 = Patient.create!(name: 'Patient 3', age: 23)
    patient_4 = Patient.create!(name: 'Patient 4', age: 24)

    dp_11 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)
    dp_12 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_2.id)
    dp_13 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_3.id)
    dp_24 = DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_4.id)

    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content("#{doctor_1.name}")
    expect(page).to have_content("#{doctor_1.specialty}")
    expect(page).to have_content("#{doctor_1.university}")

    expect(page).to have_content("#{hospital_1.name}")
    expect(page).to_not have_content("#{hospital_2.name}")

    expect(page).to have_content("#{patient_1.name}")
    expect(page).to have_content("#{patient_2.name}")
    expect(page).to have_content("#{patient_3.name}")
    expect(page).to_not have_content("#{patient_4.name}")


  end

end
