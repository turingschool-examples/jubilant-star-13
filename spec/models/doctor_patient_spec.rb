require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  describe 'relationships' do
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
  end

  let!(:hosp_1) { Hospital.create!(name: 'hosp_1') }
  let!(:hosp_2) { Hospital.create!(name: 'hosp_2') }

  let!(:doc_1) { Doctor.create!(name: 'doc_1', specialty: 'spec_1', university: 'uni_1', hospital: hosp_1) }
  let!(:doc_2) { Doctor.create!(name: 'doc_2', specialty: 'spec_2', university: 'uni_2', hospital: hosp_2) }

  let!(:pat_1) { Patient.create!(name: 'pat_1', age: 1) }
  let!(:pat_2) { Patient.create!(name: 'pat_2', age: 2) }
  let!(:pat_3) { Patient.create!(name: 'pat_3', age: 3) }
  let!(:pat_4) { Patient.create!(name: 'pat_4', age: 4) }
  
  let!(:doc_pat_1) { DoctorPatient.create!(doctor: doc_1, patient: pat_1) }
  let!(:doc_pat_2) { DoctorPatient.create!(doctor: doc_1, patient: pat_2) }
  let!(:doc_pat_3) { DoctorPatient.create!(doctor: doc_2, patient: pat_4) }
  let!(:doc_pat_4) { DoctorPatient.create!(doctor: doc_1, patient: pat_3) }

  describe 'class methods' do
    describe '::find_by_doc_pat' do
      it 'returns the doctor_patient record' do
        expect(DoctorPatient.find_by_doc_pat(doc_1, pat_1)).to eq(doc_pat_1)
        expect(DoctorPatient.find_by_doc_pat(doc_1, pat_2)).to eq(doc_pat_2)
        expect(DoctorPatient.find_by_doc_pat(doc_1, pat_3)).to eq(doc_pat_4)
        expect(DoctorPatient.find_by_doc_pat(doc_2, pat_4)).to eq(doc_pat_3)
      end
    end
  end
end
