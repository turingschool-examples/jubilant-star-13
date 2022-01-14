require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many(:doctors) }
    it { should have_many(:doctor_patients).through(:doctors) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  let!(:hosp_1) { Hospital.create!(name: 'hosp_1') }
  let!(:hosp_2) { Hospital.create!(name: 'hosp_2') }

  let!(:doc_1) { Doctor.create!(name: 'doc_1', specialty: 'spec_1', university: 'uni_1', hospital: hosp_1) }
  let!(:doc_2) { Doctor.create!(name: 'doc_2', specialty: 'spec_2', university: 'uni_2', hospital: hosp_2) }
  let!(:doc_3) { Doctor.create!(name: 'doc_3', specialty: 'spec_3', university: 'uni_3', hospital: hosp_1) }
  let!(:doc_4) { Doctor.create!(name: 'doc_4', specialty: 'spec_4', university: 'uni_1', hospital: hosp_1) }

  describe 'instance methods' do
    describe '#doctor_count' do
      it 'returns the total doctor count that work at the hospital' do
        expect(hosp_1.doctor_count).to eq(3)
        expect(hosp_1.doctor_count).not_to eq(4)
        expect(hosp_2.doctor_count).to eq(1)
      end
    end
  end
end
