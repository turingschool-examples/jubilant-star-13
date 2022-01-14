require 'rails_helper'

RSpec.describe Doctor do

  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe "class methods"
    it "provides a full list of all universities" do 
      hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      doctor1 = Doctor.create!(name: "Calliope Torres", specialty: "Orthopedics", university: "UC Berkeley Medical School", hospital_id: hospital1.id)
      doctor2 = Doctor.create!(name: "Owen Hunt", specialty: "Trauma Surgery", university: "UC Berkeley Medical School", hospital_id: hospital1.id)
      doctor3 = Doctor.create!(name: "Mark Sloane", specialty: "Plastic Surgery", university: "LA Med", hospital_id: hospital1.id)

      expect(Doctor.universities).to contain_exactly("UC Berkeley Medical School", "LA Med")
    end

end
