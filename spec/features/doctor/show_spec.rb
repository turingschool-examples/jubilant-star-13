require 'rails_helper'

RSpec.describe "Doctor Show" do
  it "when I visit the show page, I see the DR's attributes, the hospital they work for, and their patients" do
    hospital = Hospital.create!(name: "Paul's Hospital")
    doctor = hospital.doctors.create!(name: "Dr. Mike", specialty: "Coding Doctor", university: "Turing")
    patient1 = Patient.create!(name: "Devin", age: 34)
    patient2 = Patient.create!(name: "Evan", age: 31)
    doctor_patient1 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
    doctor_patient2 = DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)

    visit "/doctors/#{doctor.id}"

    expect(page).to have_content(hospital.name)
    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.university)
    expect(page).to have_content(doctor.specialty)
    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
  end
end
