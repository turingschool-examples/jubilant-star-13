require 'rails_helper'

RSpec.describe Hospital do
  let!(:hospital_1) { Hospital.create!(name: "Arkham Hospital")}
  let!(:hospital_2) { Hospital.create!(name: "Metropolis")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Bruce", specialty: "Surgery", university: "Stanford University")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Alfred", specialty: "Physical Therapy", university: "Stanford University")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dick Grayson", specialty: "Nurse", university: "Johns Hopkins University")}

  let!(:patient_1) {Patient.create!(name: "Jack Napier", age: 90)}
  let!(:patient_2) {Patient.create!(name: "Selena Kyle", age: 80)}
  let!(:patient_3) {Patient.create!(name: "Oswald Cobblepot", age: 70)}
  let!(:patient_4) {Patient.create!(name: "Edward Nigma", age: 60)}

  let!(:doctor_patient_1) {DoctorPatient.create!(patient_id: patient_1.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(patient_id: patient_2.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_3) {DoctorPatient.create!(patient_id: patient_3.id, doctor_id: doctor_2.id)}
  let!(:doctor_patient_4) {DoctorPatient.create!(patient_id: patient_4.id, doctor_id: doctor_2.id)}
  
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do 
    it 'returns the number of doctors that work in a hospital' do 
      expect(hospital_1.doctor_count).to eq(2)
    end

    it 'returns a unique list of universities attended by doctors in a hospital' do 
      expect(hospital_1.unique_university_list).to eq([doctor_1.university, doctor_3.university])
    end 
  end
end
