require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  describe 'view' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      @doctor_1 = @hospital_1.create!(name: "Dr. X", specialty: "X-men Repair", university: "Yale")

      @patient_1 = Patient.create!(name: "Kayla", age: "34")
      @patient_2 = Patient.create!(name: "Fred", age: "30")
      @patient_3 = Patient.create!(name: "Marc", age: "50")

      @patient_1.doctor_patients.create!(doctor_id: @doctor_1.id)
      @patient_2.doctor_patients.create!(doctor_id: @doctor_1.id)
      @patient_3.doctor_patients.create!(doctor_id: @doctor_1.id)
    end
  end
end
