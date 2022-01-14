require 'rails_helper'
RSpec.describe "the hospital show page" do

  let!(:hospital_1) {Hospital.create!(name: "Kaweah Delta")}
  let!(:hospital_2) {Hospital.create!(name: "Porterville General")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Dr. Sunset", specialty: "bones", university: "CU")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. Sanchez", specialty: "hair grafts", university: "CU")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dr. Benway", specialty: "experimental surgery", university: "U Interzone")}
  let!(:doctor_4) {hospital_2.doctors.create!(name: "Dr. Nick", specialty: "general", university: "Hollywood Upstairs Medical College")}

  let!(:patient_1) {doctor_1.patients.create!(name: "Crobonis Paredes", age: 20)}
  let!(:patient_2) {doctor_1.patients.create!(name: "Borton Preekers", age: 30)}
  let!(:patient_3) {doctor_4.patients.create!(name: "Michael Gudinski", age: 30)}

  it "shows the hospital name" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content("Kaweah Delta")
  end

  it "shows a count of doctors that work at the hospital" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content("Doctor Count: 3")
  end

  it "shows the unique universities it's doctors attended" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(doctor_2.university)
    expect(page).to have_content("CU", count: 1)
    save_and_open_page
  end
end