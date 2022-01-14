require 'rails_helper'

RSpec.describe 'doctor show page' do
  let!(:hospital) {Hospital.create!(name: "Grey Sloan Memorial Hospital")}
  let!(:bailey) {hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")}
  let!(:perez) {hospital.doctors.create!(name: "Sergio Perez", specialty: "Neurology", university: "UTHSC")}
  before(:each) do
    visit "/doctors/#{perez.id}"
  end

  it 'shows doctors name' do
    expect(page).to have_content("Sergio Perez")
  end

  it 'shows doctors specialty' do
    expect(page).to have_content("Neurology")
  end

  it 'shows doctors university' do
    expect(page).to have_content("UTHSC")
  end

  it 'shows doctors hospital' do
    expect(page).to have_content('Grey Sloan Memorial Hospital')
  end

  it 'shows all of doctors patients' do
    expect(page).to have_content()
