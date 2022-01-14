require 'rails_helper'

RSpec.describe 'doctor show page' do
  it 'shows the doctors information /  their hospital and patients ' do
    hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    doctor = hospital.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery',
                                      university: 'Stanford University')
    patient_1 = doctor.patients.create!(name: 'patty', age: 22)
    patient_2 = doctor.patients.create!(name: 'john', age: 35)
    patient_3 = doctor.patients.create!(name: 'sally', age: 33)
    visit doctor_path(doctor)

    within '.doctor' do
      expect(page).to have_content("Doctor: #{doctor.name}")
      expect(page).to have_content("Specialty: #{doctor.specialty}")
      expect(page).to have_content("University: #{doctor.university}")
      expect(page).to have_content("Hospital: #{doctor.hospital.name}")
    end
    within '.patients' do
      expect(page).to have_content("Patient name: #{patient_1.name}")
      expect(page).to have_content("Patient name: #{patient_2.name}")
      expect(page).to have_content("Patient name: #{patient_3.name}")
    end
  end
  it 'has a button next to each patient to remove that patient' do
    hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    doctor = hospital.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery',
                                      university: 'Stanford University')
    patient_1 = doctor.patients.create!(name: 'patty', age: 22)
    patient_2 = doctor.patients.create!(name: 'john', age: 35)
    patient_3 = doctor.patients.create!(name: 'sally', age: 33)

    visit doctor_path(doctor)

    within '.patients' do
      expect(page).to have_button("Remove: #{patient_1.name}")
      expect(page).to have_button("Remove: #{patient_2.name}")
      expect(page).to have_button("Remove: #{patient_3.name}")

      click_button "Remove: #{patient_3.name}"

      expect(current_path).to eq(doctor_path(doctor))

      expect(page).to_not have_content("Patient name: #{patient_3.name}")
    end
  end
end
