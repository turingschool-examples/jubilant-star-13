require 'rails_helper'

RSpec.describe Hospital do
  before(:each) do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @doctor = @hospital.doctors.create!(name: 'Joe Schmoe', specialty: 'General Surgery', university: "Stanford University")
    @doctor_1 = @hospital.doctors.create!(name: 'Moe Schmoe', specialty: 'Dentist', university: "University")
    @doctor_2 = @hospital.doctors.create!(name: 'John Smith', specialty: 'Physical Therapist', university: "Generic University")

  end

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe "doctor_count" do
    it 'counts the number of doctors' do
      expect(@hospital.doctor_count).to eq(3)
    end
  end
end
