require 'rails_helper'

RSpec.describe 'Doctors show page' do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Turing Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor Turing", specialty: "ENT", university: "Turing Medical School")

    @patient1 = Patient.create!(name: "Joe Patient", age: 25)
    @patient2 = Patient.create!(name: "Josephine Patient", age: 72)

    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)

    visit "/doctors/#{@doctor1.id}"
  end

  describe 'when I visit the doctor show page' do
    it 'shows the doctors information including name, specialty, and university' do
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content(@doctor1.university)
    end

    it 'shows me the name of the hospital where the doctor works' do
      expect(page).to have_content("Hospital: #{@hospital1.name}")
    end

    it 'shows the names of all of the patients this doctor has' do
      expect(page).to have_content("Patients of #{@doctor1.name}")
      expect(page).to have_content("Patient Name: #{@patient1.name}")
      expect(page).to have_content("Patient Name: #{@patient2.name}")
    end

    it 'has a button next to each patients name to remove the patient from the doctors caseload' do
      click_button("Remove #{@patient1.name}") # , href: "/doctors/#{@doctor1.id}/patients/#{@patient1.id}"
      # save_and_open_page

      expect(current_path).to eq("/doctors/#{@doctor1.id}")

      expect(page).to have_content(@patient2.name)
      expect(page).to_not have_content(@patient1.name)
    end
  end
end
