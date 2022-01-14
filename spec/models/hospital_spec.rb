require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  let!(:hospital_1) {Hospital.create!(name: "St. Mary's")}
  let!(:hospital_2) {Hospital.create!(name: "Hospital 2")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Grey Bones", specialty: "OB/GYN", university: "Vanderbilt Medical School")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. House", specialty: "Psychology", university: "Yale Medical")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dr. Bill", specialty: "Ontology", university: "Franklin Medical")}
  let!(:doctor_4) {hospital_2.doctors.create!(name: "Dr. Fran", specialty: "Ontology", university: "UCLA")}

  describe 'instance methods' do
    describe '#hospital_doctor_universities' do
      it 'returns a list of universities for doctors available at that hospital' do
        expect(hospital_1.hospital_doctor_universities).to match_array(["Vanderbilt Medical School", "Yale Medical", "Franklin Medical"])
        expect(hospital_2.hospital_doctor_universities).to match_array(["UCLA"])
      end
    end
  end
end
