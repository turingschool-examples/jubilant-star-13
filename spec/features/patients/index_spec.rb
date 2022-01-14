require 'rails_helper'

RSpec.describe 'patients index page' do
  let!(:hospital_1) { Hospital.create!(name: "Arkham Hospital")}
  let!(:hospital_2) { Hospital.create!(name: "Metropolis")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Bruce", specialty: "Surgery", university: "Johns Hopkins University")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Alfred", specialty: "Physical Therapy", university: "Stanford University")}

  let!(:patient_1) {Patient.create!(name: "Selena Kyle", age: 80)}
  let!(:patient_2) {Patient.create!(name: "Jack Napier", age: 90)}
  let!(:patient_3) {Patient.create!(name: "Edward Nigma", age: 60)}
  let!(:patient_4) {Patient.create!(name: "Oswald Cobblepot", age: 70)}

  let!(:doctor_patient_1) {DoctorPatient.create!(patient_id: patient_1.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(patient_id: patient_2.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_3) {DoctorPatient.create!(patient_id: patient_3.id, doctor_id: doctor_2.id)}
  let!(:doctor_patient_4) {DoctorPatient.create!(patient_id: patient_4.id, doctor_id: doctor_2.id)}

  it 'lists patients from oldest to youngest' do 
    visit "/patients"

    expect(patient_2.name).to appear_before(patient_1.name)
    expect(patient_1.name).to appear_before(patient_4.name)
    expect(patient_4.name).to appear_before(patient_3.name)
  end
end