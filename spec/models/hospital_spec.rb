require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'model methods' do
    it '#unique_universities' do
      hospital1 = Hospital.create!(name: 'hospital1')

      doctor1 = hospital1.doctors.create!(name: 'doctor1', specialty: 'specialty1', university: 'university1')
      doctor2 = hospital1.doctors.create!(name: 'doctor2', specialty: 'specialty2', university: 'university2')
      doctor3 = hospital1.doctors.create!(name: 'doctor3', specialty: 'specialty3', university: 'university3')
      doctor4 = hospital1.doctors.create!(name: 'doctor4', specialty: 'specialty4', university: 'university3')

      expect(hospital1.unique_universities).to eq(['university1', 'university2', 'university3'])

    end
  end
end
