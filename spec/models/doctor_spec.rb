require 'rails_helper'

RSpec.describe Doctor do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name:"Other hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @meredith = @hospital.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Washington University")
    @derek = @hospital.doctors.create!(name: "Derek Shepherd", specialty: "Neuro Surgery", university: "Washington University")
    @christina = @hospital2.doctors.create!(name: "Christina Yang", specialty: "Cardio Surgery", university: "Harvard University")
  end
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:patient_doctors) }
    it { should have_many(:patients).through(:patient_doctors) }
  end

  it "#unique_universities" do
    expect(Doctor.unique_universities).to eq([@bailey.university, @meredith.university, @christina.university])
  end 
end
