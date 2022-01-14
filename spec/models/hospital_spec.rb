require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    let!(:hospital) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
    let!(:bailey) {hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")}
    let!(:perez) {hospital.doctors.create!(name: "Sergio Perez", specialty: "Neurology", university: "UTHSC")}
    let!(:patient_1) {perez.patients.create!(name: "Patient 1")}
    let!(:patient_2) {perez.patients.create!(name: "Patient 2")}
    let!(:patient_3) {bailey.patients.create!(name: "Patient 3")}
    let!(:patient_4) {bailey.patients.create!(name: "Patient 4")}

    describe '#doctor_count' do
      it 'returns number of doctors for university' do
        expect(hospital.doctor_count).to eq(2)
      end
    end

    describe '#doctor_university_list' do
      it 'returns list of universities for hospital doctors' do
        expect(hospital.doctor_university_list).to eq(["Stanford University", "UTHSC"])
      end
    end
  end 
end
