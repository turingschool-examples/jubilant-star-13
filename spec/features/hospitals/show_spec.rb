require 'rails_helper'

RSpec.describe 'the hospital show page' do
  it 'lists a hospitals doctors and unique list of universities' do
    hosp_1 = Hospital.create!(name: "Hospital 1")
    hosp_2 = Hospital.create!(name: "Hospital 2")
    dr_1 = hosp_1.doctors.create!(name: "Dr. 1", specialty: "Specialty 1", university: "University 1")
    dr_2 = hosp_1.doctors.create!(name: "Dr. 2", specialty: "Specialty 2", university: "University 2")
    dr_3 = hosp_1.doctors.create!(name: "Dr. 3", specialty: "Specialty 3", university: "University 3")
    dr_4 = hosp_1.doctors.create!(name: "Dr. 4", specialty: "Specialty 1", university: "University 1")
    dr_5 = hosp_2.doctors.create!(name: "Dr. 5", specialty: "Specialty 2", university: "University 4")
    dr_6 = hosp_2.doctors.create!(name: "Dr. 6", specialty: "Specialty 3", university: "University 5")

    visit "/hospitals/#{hosp_1.id}"

    expect(page).to have_content(hosp_1.name)
    expect(page).to have_content("Number of doctors that work at hospital: 4")
    expect(page).to have_content("These doctors have attended these universities: University 1, University 2, University 3")
  end
end
