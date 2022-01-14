require 'rails_helper'

RSpec.describe DoctorPatient do
  describe 'relationships' do
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
  end

  describe 'class methods' do
    let!(:hospital) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
    let!(:bailey) {hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")}
    let!(:perez) {hospital.doctors.create!(name: "Sergio Perez", specialty: "Neurology", university: "UTHSC")}
    let!(:patient_1) {perez.patients.create!(name: "Patient 1")}
    let!(:patient_2) {perez.patients.create!(name: "Patient 2")}
    let!(:patient_3) {bailey.patients.create!(name: "Patient 3")}
    let!(:patient_4) {bailey.patients.create!(name: "Patient 4")}
  end
end
