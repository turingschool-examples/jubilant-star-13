require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
    it { should have_many(:hospitals).through(:doctors) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  let!(:pat_1) { Patient.create!(name: 'pat_1', age: 1) }
  let!(:pat_2) { Patient.create!(name: 'pat_2', age: 2) }
  let!(:pat_3) { Patient.create!(name: 'pat_3', age: 3) }
  let!(:pat_4) { Patient.create!(name: 'pat_4', age: 4) }

  describe 'class methods' do
    describe '::age_ordered' do
      it 'returns a list of all patients ordered by age oldest to youngest' do
        expect(Patient.all).to eq([pat_1, pat_2, pat_3, pat_4])
        expect(Patient.age_ordered).to eq([pat_4, pat_3, pat_2, pat_1])
      end
    end
  end
end
