require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe '::order_by_age' do
    let!(:denny) {Patient.create!(name: "Denny Duquette", age: 39)}
    let!(:bob) {Patient.create!(name: "Bob Duquette", age: 44)}
    let!(:larry) {Patient.create!(name: "Larry Duquette", age: 27)}
    
    it 'orders all patients by age, oldest to youngest' do
      expect(Patient.order_by_age).to eq([bob, denny, larry])
    end
  end
end
