require 'rails_helper'

RSpec.describe Patient, type: :model do 

  describe "relationships" do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  it "provides list of all patients ordered by age, oldest to youngest" do 
    patient1 = Patient.create!(name: "Jimmy", age:7)
    patient2 = Patient.create!(name: "Edward", age:16)
    patient3 = Patient.create!(name: "Bill", age:40)
    patient4 = Patient.create!(name: "Evelyn", age:60)

    expect(Patient.by_age).to eq([patient4, patient3, patient2, patient1])
  end
end
