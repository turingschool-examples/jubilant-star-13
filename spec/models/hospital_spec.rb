require 'rails_helper'

RSpec.describe Hospital do

  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Childrens Hospital')

    @doctor_1 = Doctor.create!(name: 'Doctor Strange', specialty: 'General Surgery', university: 'Stanford university', hospital_id: @hospital_1.id)
    @doctor_2 = Doctor.create!(name: 'Doctor Jenner', specialty: 'Brain Surgery', university: 'Harvard university', hospital_id: @hospital_1.id)
    @doctor_3 = Doctor.create!(name: 'Doctor Hash', specialty: 'Doctor Stuff', university: 'Some university', hospital_id: @hospital_1.id)
    @doctor_3 = Doctor.create!(name: 'Doctor Integer', specialty: 'Counting', university: 'Some university', hospital_id: @hospital_1.id)
    @doctor_4 = Doctor.create!(name: 'Doctor String', specialty: 'Orthopedics', university: 'Harvard university', hospital_id: @hospital_2.id)
  end

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'doctor_count' do
    it 'returns the number of doctors that work at this hospital' do
      expect(@hospital_1.doctor_count).to eq(4)
    end
  end

  describe 'unique_universities' do
    it 'returns the names of universities that the doctors attend' do
      expect(@hospital_1.universities).to eq(["Harvard university", "Some university", "Stanford university"])
    end
  end

end
