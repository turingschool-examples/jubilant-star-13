require 'rails_helper'

RSpec.describe Patient do
  it { should have_many :doctor_patients}
  it { should have_many(:doctors).through(:doctor_patients)}

  describe 'class methods' do
    it 'orders patients by age from oldest to youngest' do
      patient_1 = Patient.create!(name: "Jake", age: 40)
      patient_2 = Patient.create!(name: "Alice", age: 65)
      patient_3 = Patient.create!(name: "Tommy", age: 10)
      patient_4 = Patient.create!(name: "Debbie", age: 50)
      patient_5 = Patient.create!(name: "Mark", age: 25)

      expect(Patient.oldest_to_youngest).to eq([patient_2, patient_4, patient_1, patient_5, patient_3])
    end
  end
end
