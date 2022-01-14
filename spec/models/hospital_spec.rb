require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end
  describe '#doctor_count' do
    it 'returns the number of docotrs at the hospital' do
      hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      doctor_1 = hospital.doctors.create!(name: 'Kim', specialty: 'General Surgery',
                                          university: 'Stanford University')
      doctor_2 = hospital.doctors.create!(name: 'Tim', specialty: 'Internal Medicine',
                                          university: 'Stanford University')
      doctor_3 = hospital.doctors.create!(name: 'Jim', specialty: 'ENT',
                                          university: 'Turing University')
      actual = hospital.doctor_count
      expected = 3
      expect(actual).to eq(expected)
    end
  end
  describe '#doctor_educations' do
    it 'returns the number of docotrs at the hospital' do
      hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      doctor_1 = hospital.doctors.create!(name: 'Kim', specialty: 'General Surgery',
                                          university: 'Stanford University')
      doctor_2 = hospital.doctors.create!(name: 'Tim', specialty: 'Internal Medicine',
                                          university: 'Stanford University')
      doctor_3 = hospital.doctors.create!(name: 'Jim', specialty: 'ENT',
                                          university: 'Turing University')
      actual = hospital.doctor_educations
      expected = 3
      expect(actual).to eq(['Stanford University', 'Turing University'])
    end
  end
end
