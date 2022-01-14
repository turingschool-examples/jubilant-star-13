require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }

    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'model methods' do
    it 'orders patients from oldest to youngest' do
      patient1 = Patient.create!(name: 'patient1', age: 1)
      patient2 = Patient.create!(name: 'patient2', age: 2)
      patient3 = Patient.create!(name: 'patient3', age: 3)

      expect(Patient.order_age).to eq([patient3, patient2, patient1])
    end
  end
end
