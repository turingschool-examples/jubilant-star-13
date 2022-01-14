require 'rails_helper'

describe 'hospital show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital.doctors.create!(name: "Grey", specialty: "Heart Surgery", university: "Stanford University")
    @doctor3 = @hospital.doctors.create!(name: "007", specialty: "Killer Surgeon", university: "Colorado Community College")

    visit "/hospitals/#{@hospital.id}"
  end
  it 'displays all hospital information' do
    expect(page).to have_content(@hospital.name)
    # show number of doctors that work at hospital
    expect(page).to have_content(@hospital.doctor_count)
    # each university should only appear once
    expect(page).to have_content(@hospital.universities)
  end
end
