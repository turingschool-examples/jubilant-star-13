require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  let!(:hospital_1) {Hospital.create!(name: "St. Mary's")}
  let!(:hospital_2) {Hospital.create!(name: "Hospital 2")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Grey Bones", specialty: "OB/GYN", university: "Vanderbilt Medical School")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. House", specialty: "Psychology", university: "Yale Medical")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dr. Bill", specialty: "Ontology", university: "UCLA")}
  let!(:doctor_4) {hospital_2.doctors.create!(name: "Dr. Fran", specialty: "Ontology", university: "UCLA")}

  describe 'class methods' do
    describe '::university_list' do
      it 'returns array of unique universities from all doctors' do
        expect(Doctor.university_list).to match_array(["Vanderbilt Medical School", "Yale Medical", "UCLA"])
      end
    end
  end
end
