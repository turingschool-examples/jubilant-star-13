require 'rails_helper'

RSpec.describe 'Patients Index Page' do
  describe 'view' do
    before(:each) do
      @patient_1 = Patient.create!(name: "Kayla", age: "34")
      @patient_2 = Patient.create!(name: "Fred", age: "30")
      @patient_3 = Patient.create!(name: "Marc", age: "50")
      @patient_4 = Patient.create!(name: "Carla", age: "100")
      @patient_5 = Patient.create!(name: "Zeek", age: "10")
    end

    it 'lists the names of the patients from oldest to youngest' do
      visit "/patients"

      expect(@patient_4.name).to appear_before(@patient_3.name)
      expect(@patient_3.name).to appear_before(@patient_1.name)
      expect(@patient_1.name).to appear_before(@patient_2.name)
      expect(@patient_2.name).to appear_before(@patient_5.name)
    end
  end
end
