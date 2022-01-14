require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    let!(:hospital) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
    let!(:bailey) {hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")}
    let!(:perez) {hospital.doctors.create!(name: "Sergio Perez", specialty: "Neurology", university: "UTHSC")}
    let!(:patient_1) {Patient.create!(name: "Patient 1")}
    let!(:patient_2) {Patient.create!(name: "Patient 2")}
    let!(:patient_3) {Patient.create!(name: "Patient 3")}
    let!(:patient_4) {Patient.create!(name: "Patient 4")}
    let!(:care_1) {DoctorPatient.create!(patient: patient_1, doctor: perez)}
    let!(:care_2) {DoctorPatient.create!(patient: patient_2, doctor: perez)}
    let!(:care_3) {DoctorPatient.create!(patient: patient_3, doctor: bailey)}
    let!(:care_4) {DoctorPatient.create!(patient: patient_4, doctor: bailey)}

    describe 'find_doctor_patient' do
      it 'finds doctor_patient record associated with doctor and patient' do
        expect(bailey.find_doctor_patient(patient_3.id)).to eq([care_3])
      end
    end
  end
end
