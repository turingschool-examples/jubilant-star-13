require 'rails_helper'

RSpec.describe Hospital do

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  it "provides a total number of doctors who work there" do 
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = Doctor.create!(name: "Calliope Torres", specialty: "Orthopedics", university: "UC Berkeley Medical School", hospital_id: hospital1.id)
    doctor2 = Doctor.create!(name: "Owen Hunt", specialty: "Trauma Surgery", university: "UC Berkeley Medical School", hospital_id: hospital1.id)
    doctor3 = Doctor.create!(name: "Mark Sloane", specialty: "Plastic Surgery", university: "LA Med", hospital_id: hospital1.id)

    expect(hospital1.total_doctors).to eq(3)
  end



end
