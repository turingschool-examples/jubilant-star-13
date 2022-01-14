require 'rails_helper'

RSpec.describe 'Doctor Show Page' do

  it 'visits a doctor show page then see all of that doctors attrubutes. Sees the name of hospital where doctor works, and all of their patients' do
    hospital1 = Hospital.create!(name: 'hospital1')

    doctor1 = hospital1.doctors.create!(name: 'doctor1', specialty: 'specialty1', university: 'university1')

    patient1 = doctor1.patients.create!(name: 'patient1', age: 1)
    patient2 = doctor1.patients.create!(name: 'patient2', age: 2)
    patient3 = Patient.create!(name: 'patient3', age: 3)

    visit doctor_path(doctor1.id)

    expect(page).to have_content(doctor1.name)
    expect(page).to have_content(doctor1.specialty)
    expect(page).to have_content(doctor1.university)

    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to_not have_content(patient3.name)

    expect(page).to have_content(hospital1.name)
  end

  it 'visits doctor show page and sees a button to remove patient from that doctors caseload, clicks button, then taken back to show page where patient no longer listed' do
    hospital1 = Hospital.create!(name: 'hospital1')

    doctor1 = hospital1.doctors.create!(name: 'doctor1', specialty: 'specialty1', university: 'university1')

    patient1 = Patient.create!(name: 'patient1', age: 1)
    patient2 = Patient.create!(name: 'patient2', age: 2)
    patient3 = Patient.create!(name: 'patient3', age: 3)

    doctor_patient1 = DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient1.id)
    doctor_patient2 = DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient2.id)
    doctor_patient3 = DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient3.id)

    visit doctor_path(doctor1.id)

    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to have_content(patient3.name)

    click_button "Remove #{patient1.name}"

    expect(current_path).to eq(doctor_path(doctor1.id))

    expect(page).to_not have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to have_content(patient3.name)
  end
end
