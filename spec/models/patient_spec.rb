require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through :doctor_patients}
  end

  it "orders patients from oldest to newest" do
    patient1 = Patient.create!(name: 'katie', age: 28)
    patient2 = Patient.create!(name: 'gus', age: 2)
    patient3 = Patient.create!(name: 'tracy', age: 40)

    expect(Patient.ordered_patients).to eq([patient3, patient1, patient2])
  end
end
