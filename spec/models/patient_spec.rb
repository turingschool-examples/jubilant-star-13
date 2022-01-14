require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    before(:each) do
      @patient_1 = Patient.create!(name: "George O'Malley", age: 35)
      @patient_2 = Patient.create!(name: "Mark Zuckerburg", age: 45)
      @patient_3 = Patient.create!(name: "Jeremy Johnson", age: 23)
      @patient_4 = Patient.create!(name: "Miranda Lambert", age: 40)
    end

    describe '::by_age_desc' do
      it 'orders all patients by age, oldest to youngest' do
        expect(Patient.by_age_desc).to eq([@patient_2, @patient_4, @patient_1, @patient_3])
      end
    end
  end
end
