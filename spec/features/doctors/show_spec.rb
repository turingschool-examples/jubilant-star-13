require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  describe 'User Story 1' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: "Rose Medical Center")
      @hospital_2 = Hospital.create!(name: "Swedish Medical Center")

      @doctor_1 = @hospital_1.doctors.create!(name: "Dr 1", specialty: "Specialty 1", university: "University 1" )
      @doctor_2 = @hospital_1.doctors.create!(name: "Dr 2", specialty: "Specialty 2", university: "University 2" )
      @doctor_3 = @hospital_2.doctors.create!(name: "Dr 3", specialty: "Specialty 3", university: "University 3" )

      @patient_1 = Patient.create!(name: "Jake", age: 40)
      @patient_2 = Patient.create!(name: "Alice", age: 65)
      @patient_3 = Patient.create!(name: "Tommy", age: 10)
      @patient_4 = Patient.create!(name: "Debbie", age: 50)
      @patient_5 = Patient.create!(name: "Mark", age: 25)

      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)

      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_4.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_5.id)
    end

    it 'shows the doctors name, specialty, and university' do
      visit "doctors/#{@doctor_1.id}"

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)

      expect(page).to_not have_content(@doctor_2.name)
      expect(page).to_not have_content(@doctor_2.specialty)
      expect(page).to_not have_content(@doctor_2.university)

      expect(page).to_not have_content(@doctor_3.name)
      expect(page).to_not have_content(@doctor_3.specialty)
      expect(page).to_not have_content(@doctor_3.university)
    end

    it 'shows the name of the hospital the doctor works at' do
      visit "doctors/#{@doctor_1.id}"

      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)
    end

    it 'shows the names of all the doctors patients' do
      visit "/doctors/#{@doctor_1.id}"

      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
      expect(page).to_not have_content(@patient_4.name)
      expect(page).to_not have_content(@patient_5.name)
    end
  end

  describe "User Story 3" do
    before(:each) do
      @hospital_1 = Hospital.create!(name: "Rose Medical Center")
      @doctor_1 = @hospital_1.doctors.create!(name: "Dr 1", specialty: "Specialty 1", university: "University 1" )
      @doctor_2 = @hospital_1.doctors.create!(name: "Dr 2", specialty: "Specialty 2", university: "University 2" )
      @patient_1 = Patient.create!(name: "Jake", age: 40)
      @patient_2 = Patient.create!(name: "Alice", age: 65)
      @patient_3 = Patient.create!(name: "Tommy", age: 10)

      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)

      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_2.id)
    end

    it 'has a button next to each patient name to delete from doctor assignment' do
      visit "/doctors/#{@doctor_1.id}"

      expect(page).to have_content(@patient_1.name)
      expect(page).to have_button("Remove #{@patient_1.name}")
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_button("Remove #{@patient_2.name}")
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_button("Remove #{@patient_3.name}")

      click_button("Remove #{@patient_1.name}")

      expect(current_path).to eq("/doctors/#{@doctor_1.id}")

      expect(page).to_not have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
    end
  end
end
