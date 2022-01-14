require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  it 'displays the hospital name, the number of doctors and the unique associated universities' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    francis = hospital.doctors.create!(name: "Francis Scott Key", specialty: "Opthamology", university: "Harvard University")
    jerry = hospital.doctors.create!(name: "Jerry Vanilla", specialty: "Resident Doctor", university: "UCLA Berkley")
    hannah = hospital.doctors.create!(name: "Hannah Fillipo", specialty: "Dermatologist", university: "Stanford University")

    visit "/hospitals/#{hospital.id}"

    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Number of Doctors Present: 4")
    expect("Universities the Doctors Attended").to appear_before("Stanford University")
  end
end 
