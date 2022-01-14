require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    it '#older_first' do
      geoff = Patient.create!(name: "Geoff Banks", age: 34)
      wilson = Patient.create!(name: "Wilson General", age: 44)
      sharina = Patient.create!(name: "Sharina Triss", age: 22)

      expect(Patient.older_first).to eq([wilson, geoff, sharina])
    end
  end
end
