require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'class and instance methods' do
    it 'should a uniqe list of universities doctors have attended' do
      @hospital_1 = Hospital.create!(name: 'hospital_1')
      @doctor_1 = Doctor.create!(name: 'doctor_1', specialty: 'specialty_1', university: 'university_1', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'doctor_2', specialty: 'specialty_2', university: 'university_2', hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: 'doctor_3', specialty: 'specialty_3', university: 'university_2', hospital_id: @hospital_1.id)
      @doctor_4 = Doctor.create!(name: 'doctor_3', specialty: 'specialty_3', university: 'university_1', hospital_id: @hospital_1.id)

      expected = ['university_1', 'university_2']
      binding.pry
      expect(@hospital_1.universities).to eq(expected)
    end
  end
end
