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
save_and_open_page
    expect(page).to have_content(@bailey.name)
    expect(page).to have_content(@bailey.specialty)
    expect(page).to have_content(@bailey.university)

    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@drew.name)
    expect(page).to have_content(@anne.name)
  end
end
