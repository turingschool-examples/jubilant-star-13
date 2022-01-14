require 'rails_helper'

RSpec.describe 'doctor show page' do
  let!(:hospital) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
  let!(:bailey) {hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")}
  let!(:perez) {hospital.doctors.create!(name: "Sergio Perez", specialty: "Neurology", university: "UTHSC")}
  let!(:patient_1) {perez.patients.create!(name: "Patient 1")}
  let!(:patient_2) {perez.patients.create!(name: "Patient 2")}
  let!(:patient_3) {bailey.patients.create!(name: "Patient 3")}
  let!(:patient_4) {bailey.patients.create!(name: "Patient 4")}

  before(:each) do
    visit "/doctors/#{perez.id}"
  end

  it 'shows doctors name' do
    expect(page).to have_content("Sergio Perez")
    expect(page).to_not have_content("Miranda Bailey")
  end

  it 'shows doctors specialty' do
    expect(page).to have_content("Neurology")
    expect(page).to_not have_content("General Surgery")
  end

  it 'shows doctors university' do
    expect(page).to have_content("UTHSC")
    expect(page).to_not have_content("Stanford University")
  end

  it 'shows doctors hospital' do
    expect(page).to have_content('Grey Sloan Memorial Hospital')
  end

  it 'shows all of doctors patients' do
    expect(page).to have_content("Patient 1")
    expect(page).to have_content("Patient 2")
    expect(page).to_not have_content("Patient 3")
    expect(page).to_not have_content("Patient 4")
  end

  it 'can remove patient' do
    within("#doctor-patient-#{patient_1.id}") do
      click_button("Remove Patient")
    end
    expect(current_path).to eq("/doctors/#{perez.id}")
    expect(page).to_not have_content("Patient 1")
  end  

end
