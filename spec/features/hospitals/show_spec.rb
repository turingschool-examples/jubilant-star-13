require 'rails_helper'

RSpec.describe 'hospital show page' do
  it 'shows the hospitals name / number of doctors for the hospital and their universitys distinct' do
    hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    hospital_2 = Hospital.create!(name: 'invalid hospital')
    doctor_1 = hospital.doctors.create!(name: 'Kim', specialty: 'General Surgery',
                                        university: 'Stanford University')
    doctor_2 = hospital.doctors.create!(name: 'Tim', specialty: 'Internal Medicine',
                                        university: 'Stanford University')
    doctor_3 = hospital.doctors.create!(name: 'Jim', specialty: 'ENT',
                                        university: 'Turing University')
    doctor_4 = hospital_2.doctors.create!(name: 'Jim', specialty: 'ENT',
                                          university: 'Devry University')

    visit hospital_path(hospital)

    within '.hospital' do
      expect(page).to have_content("Hospital: #{hospital.name}")
      expect(page).to have_content("Doctors on staff: #{hospital.doctor_count}")
      expect(page).to have_content("University's of the doctors: #{hospital.doctor_educations.join(', ')}")
      expect(page).to_not have_content("Hospital: #{hospital_2.name}")
      expect(page).to_not have_content(doctor_4.university)
    end
  end
end
