require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @general_hospital = Hospital.create!(name: "Slide Park General Hospital")

    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @emerick = @hospital.doctors.create!(name: "Ed Emerick", specialty: "Pediatrics", university: "Stanford")
    @lagrange = @hospital.doctors.create!(name: "Barnard LaGrange", specialty: "Opthalmology", university: "University of Washington")
  end

  describe 'instance methods' do
    it '#universities' do
      expect(@hospital.universities).to eq(["Stanford University", "University of Michigan"])
    end
  end
end
