require 'rails_helper'

RSpec.describe Patient, type: :model do
  let!(:hospital_1) { Hospital.create!(name: "Arkham Hospital")}
  let!(:hospital_2) { Hospital.create!(name: "Metropolis")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Bruce", specialty: "Surgery", university: "Johns Hopkins University")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Alfred", specialty: "Physical Therapy", university: "Stanford University")}

  let!(:patient_1) {Patient.create!(name: "Selena Kyle", age: 80)}
  let!(:patient_2) {Patient.create!(name: "Jack Napier", age: 90)}
  let!(:patient_3) {Patient.create!(name: "Edward Nigma", age: 60)}
  let!(:patient_4) {Patient.create!(name: "Oswald Chesterfield Cobblepot", age: 70)}

  let!(:doctor_patient_1) {DoctorPatient.create!(patient_id: patient_1.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(patient_id: patient_2.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_3) {DoctorPatient.create!(patient_id: patient_3.id, doctor_id: doctor_2.id)}
  let!(:doctor_patient_4) {DoctorPatient.create!(patient_id: patient_4.id, doctor_id: doctor_2.id)}
  
  describe 'relationships' do 
    it {should have_many(:doctor_patients)}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do 
    it 'returns patient names in descending order by age' do 
      expect(Patient.order_names_by_age_desc).to eq([patient_2.name, patient_1.name, patient_4.name, patient_3.name])
    end
  end
end
