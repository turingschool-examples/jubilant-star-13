require 'rails_helper'

RSpec.describe 'Doctors Show Page' do
  it 'displays the doctors attributes, the hospital associated and patients given' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    geoff = Patient.create!(name: "Geoff Banks", age: 34)
    wilson = Patient.create!(name: "Wilson General", age: 44)
    sharina = Patient.create!(name: "Sharina Triss", age: 22)
    doctor_patient_1 = DoctorPatient.create!(doctor_id: bailey.id, patient_id: geoff.id)
    doctor_patient_2 = DoctorPatient.create!(doctor_id: bailey.id, patient_id: sharina.id)
    visit "/hospitals/#{hospital.id}/doctors/#{bailey.id}"

    expect(page).to have_content("Miranda Bailey")
    expect(page).to have_content("General Surgery")
    expect(page).to have_content("Stanford University")
    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect("Patients").to appear_before("Geoff Banks")
    expect(page).to_not have_content("Wilson General")
  end
end
