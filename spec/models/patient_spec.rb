require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  let!(:hospital_1) {Hospital.create!(name: "St. Mary's")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Grey Bones", specialty: "OB/GYN", university: "Vanderbilt Medical School")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. House", specialty: "Psychology", university: "Yale Medical")}

  let!(:patient_1) {Patient.create!(name: 'Billy Ray', age: 43)}
  let!(:patient_2) {Patient.create!(name: 'Dolly Parton', age: 50)}
  let!(:patient_3) {Patient.create!(name: 'Michael Buble', age: 34)}
  let!(:patient_4) {Patient.create!(name: 'Stevie Ray Vaughn', age: 76)}

  let!(:doctor_patient_1) {DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_1.id)}

  describe 'instance methods' do
    describe '#find_doctor_patient_record_id' do
      it 'returns the doctor_patient record ID with doctor_id as param' do
        expect(patient_1.find_doctor_patient_record_id(doctor_1.id)).to eq(doctor_patient_1.id)
        expect(patient_1.find_doctor_patient_record_id(doctor_2.id)).to eq(doctor_patient_2.id)
      end
    end
  end

  describe 'class methods' do
    describe '#order_youngest_to_oldest' do
      it 'orders all patients by age from young to old' do
        expect(Patient.order_youngest_to_oldest).to eq([patient_3, patient_1, patient_2, patient_4])
      end
    end
  end
end
