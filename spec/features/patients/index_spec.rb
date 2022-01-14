require 'rails_helper'

RSpec.describe 'the patients index page' do
  it 'lists all patients in order of age with oldest first' do
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

    visit "/patients"

    expect(pat_6.name).to appear_before(pat_5.name)
    expect(pat_5.name).to appear_before(pat_4.name)
    expect(pat_4.name).to appear_before(pat_1.name)
    expect(pat_1.name).to appear_before(pat_3.name)
    expect(pat_3.name).to appear_before(pat_2.name)
  end
end
