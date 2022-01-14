require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  it 'visits hospital show page, sees hospital name, number of doctors, and unique list of univeristies of doctors' do
    hospital1 = Hospital.create!(name: 'hospital1')

    doctor1 = hospital1.doctors.create!(name: 'doctor1', specialty: 'specialty1', university: 'university1')
    doctor2 = hospital1.doctors.create!(name: 'doctor2', specialty: 'specialty2', university: 'university2')
    doctor3 = hospital1.doctors.create!(name: 'doctor3', specialty: 'specialty3', university: 'university3')
    doctor4 = hospital1.doctors.create!(name: 'doctor4', specialty: 'specialty4', university: 'university3')

    visit hospital_path(hospital1)

    expect(page).to have_content("Number of Doctors: 4")
    expect(page).to have_content('university1')
    expect(page).to have_content('university2')
    expect(page).to have_content('university3')
  end
end
