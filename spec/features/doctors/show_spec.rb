require 'rails_helper'

RSpec.describe 'Doctor Show Page' do

  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @drew = Patient.create!(name: "Drew Jones", age: 30)
    @anne = Patient.create!(name: "Anne Brady", age: 50)

    @patient_doctor = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @drew.id)
    @patient_doctor = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @anne.id)
  end

  it 'displays doctor, hospital, patient info' do
    visit "/doctors/#{@bailey.id}"

    expect(page).to have_content(@bailey.name)
    expect(page).to have_content(@bailey.specialty)
    expect(page).to have_content(@bailey.university)

    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@drew.name)
    expect(page).to have_content(@anne.name)
  end

  it 'can remove a patient from a doctor' do
    visit "/doctors/#{@bailey.id}"

    expect(page).to have_content("Drew Jones")

    click_button "Remove Drew Jones"

    expect(current_path).to eq("/doctors/#{@bailey.id}")
    expect(page).to_not have_content("Drew Jones")
    expect(@drew.name).to eq("Drew Jones")
  end
end
