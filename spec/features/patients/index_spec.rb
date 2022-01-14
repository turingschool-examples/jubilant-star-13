require 'rails_helper'

RSpec.describe "Patient Index" do
  it "has all patient names listed from oldest to youngest" do
    hospital = Hospital.create!(name: "Paul's Hospital")
    doctor = hospital.doctors.create!(name: "Dr. Mike", specialty: "Coding Doctor", university: "Turing")
    patient1 = Patient.create!(name: "Devin", age: 25)
    patient2 = Patient.create!(name: "Evan", age: 31)
    patient3 = Patient.create!(name: "Paul", age: 10)
    doctor_patient1 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
    doctor_patient2 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)
    doctor_patient3 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient3.id)

    visit "/patients"

    expect(patient2.name).to appear_before(patient1.name)
    expect(patient1.name).to appear_before(patient3.name)
  end
end
