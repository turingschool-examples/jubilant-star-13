require 'rails_helper'
RSpec.describe "the doctors show page" do

  let!(:hospital_1) {Hospital.create!(name: "Kaweah Delta")}
  let!(:hospital_2) {Hospital.create!(name: "Porterville General")}


  let!(:doctor_1) {hospital_1.doctors.create!(name: "Dr. Sunset", specialty: "bones", university: "CU")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. Sanchez", specialty: "hair grafts", university: "CU")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dr. Benway", specialty: "experimental surgery", university: "U Interzone")}
  let!(:doctor_4) {hospital_2.doctors.create!(name: "Dr. Nick", specialty: "general", university: "Hollywood Upstairs Medical College")}


  let!(:patient_1) {doctor_1.patients.create!(name: "Crobonis Paredes", age: 20)}
  let!(:patient_2) {doctor_1.patients.create!(name: "Borton Preekers", age: 30)}
  let!(:patient_3) {doctor_4.patients.create!(name: "Michael Gudinski", age: 30)}



  it "shows the doctor's information" do
    visit "/doctors/#{doctor_1.id}"
    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_1.specialty)
    expect(page).to have_content(doctor_1.university)
  end

  it "shows the hospital where the doctor works at" do
    visit "/doctors/#{doctor_1.id}"
    expect(page).to have_content(hospital_1.name)
    expect(page).to_not have_content(hospital_2.name)

  end

  it "shows the doctor's patients" do
    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content(patient_1.name)
    expect(page).to have_content(patient_2.name)
    expect(page).to_not have_content(patient_3.name)
  end

  it "has a button that removes a patient from a doctor" do
    visit "/doctors/#{doctor_1.id}"
    expect(page).to have_button("Remove #{patient_1.name} from #{doctor_1.name}")
    click_button("Remove #{patient_1.name} from #{doctor_1.name}")
    expect(current_path).to eq("/doctors/#{doctor_1.id}")
    expect(page).to_not have_content(patient_1.name)
  end
end