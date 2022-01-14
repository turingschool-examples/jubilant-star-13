require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it '#assoc_universities shows unique universities that the doctors went to' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      francis = hospital.doctors.create!(name: "Francis Scott Key", specialty: "Opthamology", university: "Harvard University")
      jerry = hospital.doctors.create!(name: "Jerry Vanilla", specialty: "Resident Doctor", university: "UCLA Berkley")
      hannah = hospital.doctors.create!(name: "Hannah Fillipo", specialty: "Dermatologist", university: "Stanford University")

      expect(hospital.assoc_universities).to eq(["Stanford University", "Harvard University", "UCLA Berkley"])
    end
  end 
end
