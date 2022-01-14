require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
  let!(:hospital_1) {Hospital.create!(name: "St. Mary's")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Grey Bones", specialty: "OB/GYN", university: "Vanderbilt Medical School")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. House", specialty: "Psychology", university: "Yale Medical")}

  let!(:patient_1) {Patient.create!(name: 'Billy Ray', age: 43)}
  let!(:patient_2) {Patient.create!(name: 'Dolly Parton', age: 50)}
  let!(:patient_3) {Patient.create!(name: 'Michael Buble', age: 34)}
  let!(:patient_4) {Patient.create!(name: 'Stevie Ray Vaughn', age: 76)}

  let!(:doctor_patient_1) {DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_2.id)}
  let!(:doctor_patient_3) {DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_3.id)}
  let!(:doctor_patient_4) {DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_4.id)}

  before(:each) do
    visit(doctor_path(doctor_1.id))
  end

  context 'When I visit a doctor show page' do
    scenario 'I see the doctor attributes' do
      expect(page).to have_content(doctor_1.name)
      expect(page).to have_no_content(doctor_2.name)
      expect(page).to have_content(doctor_1.specialty)
      expect(page).to have_content(doctor_1.university)
    end

    scenario 'I see the hospital where the doctor works' do
      expect(page).to have_content(hospital_1.name)
    end

    scenario 'I see all the names of patients this doctor has' do
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
      expect(page).to have_no_content(patient_4.name)
    end

    context'to remove a patient from doctor case load' do
      scenario 'I see a button to remove the patient' do
        within "#patient#{patient_1.id}" do
          expect(page).to have_button("Remove Patient")
        end
      end

      scenario 'I click the button for one patient, am redirected to doctor show page, and patients name is not listed' do
        expect(page).to have_content(patient_1.name)
        expect(page).to have_content(patient_2.name)
        expect(page).to have_content(patient_3.name)
        expect(current_path).to eq(doctor_path(doctor_1.id))

        within "#patient#{patient_1.id}" do
          expect(page).to have_button("Remove Patient")
          click_button "Remove Patient"
        end

        expect(current_path).to eq(doctor_path(doctor_1.id))
        expect(page).to have_no_content(patient_1.name)
        expect(page).to have_content(patient_2.name)
        expect(page).to have_content(patient_3.name)

        within "#patient#{patient_2.id}" do
          expect(page).to have_button("Remove Patient")
          click_button "Remove Patient"
        end

        expect(current_path).to eq(doctor_path(doctor_1.id))
        expect(page).to have_no_content(patient_2.name)
        expect(page).to have_content(patient_3.name)
      end

      scenario 'I remove patient from doctor workload but not from database' do
        within "#patient#{patient_1.id}" do
          click_button "Remove Patient"
        end

        expect(page).to have_no_content(patient_1.name)
        expect(patient_1).to be_instance_of(Patient)
      end
    end
  end
end

#   User Story 3, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
#
# NOTE: the patient record should not be deleted entirely
