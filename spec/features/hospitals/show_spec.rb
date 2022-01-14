require 'rails_helper'

RSpec.describe 'hospital show page' do
  let!(:grace) {Hospital.create!(name: "Seattle Grace Memorial Hospital")}
  let!(:tacoma) {Hospital.create!(name: "Tacoma Ungraceful Memorial Hospital")}

  let!(:bailey) {Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: grace)}
  let!(:merideth) {Doctor.create!(name: "Merideth Grey", specialty: "General Surgery", university: "Boston University", hospital: grace)}
  let!(:dreamy) {Doctor.create!(name: "Doctor Dreamy", specialty: "Neuroscience", university: "Boston University", hospital: grace)}

  let!(:not_dreamy) {Doctor.create!(name: "Not Dreamy", specialty: "General Surgery", university: "Boston University", hospital: tacoma)}
  let!(:nightmare) {Doctor.create!(name: "Scary Dude", specialty: "Child Psyche", university: "Brown University", hospital: tacoma)}
  let!(:ugly) {Doctor.create!(name: "Ugly Doctor", specialty: "Plastic Surgery", university: "Brown University", hospital: tacoma)}
  let!(:doctor) {Doctor.create!(name: "Doctor Doctor", specialty: "Doctoring", university: "Doctor University", hospital: tacoma)}

  it 'shows the hospitals name' do
    visit "/hospitals/#{grace.id}"

    expect(page).to have_content("Seattle Grace Memorial Hospital's Information")

    visit "/hospitals/#{tacoma.id}"

    expect(page).to have_content("Tacoma Ungraceful Memorial Hospital's Information")
  end

  it 'shows the number of doctors working at the hospital' do
    visit "/hospitals/#{grace.id}"

    expect(page).to have_content("Number of Doctors employed: 3")

    visit "/hospitals/#{tacoma.id}"

    expect(page).to have_content("Number of Doctors employed: 4")
  end

  it 'lits the unique universities that its doctors have attended' do
    visit "/hospitals/#{grace.id}"

    expect(page).to have_content("Schools Attended by Staff")
    expect(page).to have_content("Stanford Univeristy")
    expect(page).to have_content("Boston University")

    visit "/hospitals/#{tacoma.id}"

    expect(page).to have_content("Schools Attended by Staff")
    expect(page).to have_content("Bostom Univeristy")
    expect(page).to have_content("Brown University")
    expect(page).to have_content("Doctor University")
  end
end
