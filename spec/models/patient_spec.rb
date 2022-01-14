require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'methods' do
    before(:each) do
      @patient_1 = Patient.create!(name: "Kayla", age: "34")
      @patient_2 = Patient.create!(name: "Fred", age: "30")
      @patient_3 = Patient.create!(name: "Marc", age: "50")
      @patient_4 = Patient.create!(name: "Carla", age: "100")
      @patient_5 = Patient.create!(name: "Zeek", age: "10")
    end

    it '#oldest_to_youngest' do
      expect(Patient.oldest_to_youngest).to eq([@patient_4, @patient_3, @patient_1, @patient_2, @patient_5])
    end
  end
end
