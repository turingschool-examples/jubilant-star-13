require 'rails_helper'
RSpec.describe "the patients index page" do

  let!(:hospital_1) {Hospital.create!(name: "Kaweah Delta")}
  let!(:hospital_2) {Hospital.create!(name: "Porterville General")}


  let!(:doctor_1) {hospital_1.doctors.create!(name: "Dr. Sunset", specialty: "bones", university: "CU")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. Sanchez", specialty: "hair grafts", university: "CU")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dr. Benway", specialty: "experimental surgery", university: "U Interzone")}
  let!(:doctor_4) {hospital_2.doctors.create!(name: "Dr. Nick", specialty: "general", university: "Hollywood Upstairs Medical College")}


  let!(:patient_1) {doctor_1.patients.create!(name: "Crobonis Paredes", age: 20)}
  let!(:patient_2) {doctor_1.patients.create!(name: "Borton Preekers", age: 30)}
  let!(:patient_3) {doctor_4.patients.create!(name: "Michael Gudinski", age: 40)}

  it "shows the name of all patients sorted by age oldest to youngest" do
    visit "/patients"
    expect(patient_3.name).to appear_before(patient_2.name)
    expect(patient_2.name).to appear_before(patient_1.name)
  end
end