require 'rails_helper'

RSpec.describe 'the doctors show page' do
  it 'lists a docotors attributes' do
    hosp_1 = Hospital.create!(name: "Hospital 1")
    hosp_2 = Hospital.create!(name: "Hospital 2")
    dr_1 = hosp_1.doctors.create!(name: "Dr. 1", specialty: "Specialty 1", university: "University 1")
    dr_2 = hosp_1.doctors.create!(name: "Dr. 2", specialty: "Specialty 2", university: "University 2")
    dr_3 = hosp_1.doctors.create!(name: "Dr. 3", specialty: "Specialty 3", university: "University 3")
    dr_4 = hosp_2.doctors.create!(name: "Dr. 4", specialty: "Specialty 1", university: "University 1")
    dr_5 = hosp_2.doctors.create!(name: "Dr. 5", specialty: "Specialty 2", university: "University 2")
    dr_6 = hosp_2.doctors.create!(name: "Dr. 6", specialty: "Specialty 3", university: "University 3")
    pat_1 = Patient.create!(name: "Patient 1", age: 34)
    pat_2 = Patient.create!(name: "Patient 2", age: 32)
    pat_3 = Patient.create!(name: "Patient 3", age: 33)
    pat_4 = Patient.create!(name: "Patient 4", age: 35)
    pat_5 = Patient.create!(name: "Patient 5", age: 36)
    pat_6 = Patient.create!(name: "Patient 6", age: 37)

    dr_1.patients << pat_1
    dr_1.patients << pat_2

    visit "/doctors/#{dr_1.id}"
    
    expect(page).to have_content(dr_1.name)
    expect(page).to have_content(dr_1.specialty)
    expect(page).to have_content(dr_1.university)

    expect(page).to have_content(dr_1.hospital.name)
    expect(page).to_not have_content(hosp_2.name)

    expect(page).to have_content(pat_1.name)
    expect(page).to have_content(pat_2.name)
    expect(page).to_not have_content(pat_3.name)
  end
end
