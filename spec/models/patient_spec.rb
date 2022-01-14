require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe "class methods" do
    it "returns patients in an order from oldest to youngest" do
      hospital = Hospital.create!(name: "Paul's Hospital")
      doctor = hospital.doctors.create!(name: "Dr. Mike", specialty: "Coding Doctor", university: "Turing")
      patient1 = Patient.create!(name: "Devin", age: 25)
      patient2 = Patient.create!(name: "Evan", age: 31)
      patient3 = Patient.create!(name: "Paul", age: 10)
      doctor_patient1 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
      doctor_patient2 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)
      doctor_patient3 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient3.id)

      expect(Patient.old_to_young).to eq([patient2, patient1, patient3])
    end
  end
end
