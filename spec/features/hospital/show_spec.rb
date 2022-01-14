require 'rails_helper'

describe 'hospital show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Do not display")

    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital.doctors.create!(name: "Grey", specialty: "Heart Surgery", university: "Stanford University")
    @doctor3 = @hospital.doctors.create!(name: "007", specialty: "Killer Surgeon", university: "Colorado Community College")

    @null_doctor4 = @hospital2.doctors.create!(name: "woirgnro", specialty: "idk", university: "School of mimes")

    visit "/hospitals/#{@hospital.id}"
  end
  it 'displays all hospital information' do
    expect(page).to have_content(@hospital.name)
    # show number of doctors that work at hospital
    expect(@hospital.doctor_count).to eq(3)
    expect(page).to have_content(@hospital.doctor_count)
    # each university should only appear once
    expect(page).to have_content("Stanford University")
    expect(page).to have_content("Colorado Community College")
  end

  it 'does not display different hospital information' do
    expect(page).not_to have_content(@hospital2.name)
    expect(page).not_to have_content(@null_doctor4.university)
  end 
end
