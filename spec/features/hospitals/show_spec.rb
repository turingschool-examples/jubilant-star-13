require 'rails_helper'

RSpec.describe 'hospital show page' do
  let!(:hospital) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
  let!(:bailey) {hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")}
  let!(:perez) {hospital.doctors.create!(name: "Sergio Perez", specialty: "Neurology", university: "UTHSC")}
  let!(:patient_1) {perez.patients.create!(name: "Patient 1")}
  let!(:patient_2) {perez.patients.create!(name: "Patient 2")}
  let!(:patient_3) {bailey.patients.create!(name: "Patient 3")}
  let!(:patient_4) {bailey.patients.create!(name: "Patient 4")}

  let!(:hospital_other) {Hospital.create!(name: "St. Lukes Baptist Hospital")}


  before(:each) do
    visit "/hospitals/#{hospital.id}"
  end

  it 'shows hospitals name' do
    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to_not have_content("St. Lukes Baptist Hospital")
  end

  it 'shows number of doctors that work at hospital' do
    expect(page).to have_content("Number of doctors: 2")
  end

  it 'shows a unique list of universities that doctors attended' do
    expect(page).to have_content("Stanford University")
    expect(page).to have_content("UTHSC")
  end
end
