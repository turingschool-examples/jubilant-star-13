require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  describe 'User Extension User Story' do
    it 'has a list of all patients names listed from oldest to youngest' do
      patient_1 = Patient.create!(name: "Jake", age: 40)
      patient_2 = Patient.create!(name: "Alice", age: 65)
      patient_3 = Patient.create!(name: "Tommy", age: 10)
      patient_4 = Patient.create!(name: "Debbie", age: 50)
      patient_5 = Patient.create!(name: "Mark", age: 25)

      visit "/patients"

      expect(patient_2.name).to appear_before(patient_4.name)
      expect(patient_4.name).to appear_before(patient_1.name)
      expect(patient_1.name).to appear_before(patient_5.name)
      expect(patient_5.name).to appear_before(patient_3.name)
    end
  end
end
