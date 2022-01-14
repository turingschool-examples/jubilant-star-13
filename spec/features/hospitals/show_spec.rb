require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  describe 'User Story 2' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: "Rose Medical Center")
      @hospital_2 = Hospital.create!(name: "Swedish Medical Center")

      @doctor_1 = @hospital_1.doctors.create!(name: "Dr 1", specialty: "Specialty 1", university: "University 1" )
      @doctor_2 = @hospital_1.doctors.create!(name: "Dr 2", specialty: "Specialty 2", university: "University 1" )
      @doctor_3 = @hospital_1.doctors.create!(name: "Dr 3", specialty: "Specialty 3", university: "University 2" )
      @doctor_4 = @hospital_1.doctors.create!(name: "Dr 4", specialty: "Specialty 4", university: "University 2" )
      @doctor_5 = @hospital_1.doctors.create!(name: "Dr 5", specialty: "Specialty 5", university: "University 3" )

      @doctor_6 = @hospital_2.doctors.create!(name: "Dr 6", specialty: "Specialty 6", university: "University 4" )
      @doctor_7 = @hospital_2.doctors.create!(name: "Dr 7", specialty: "Specialty 7", university: "University 5" )
    end

    it 'has the hospital name' do
      visit "/hospitals/#{@hospital_1.id}"

      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)
    end

    it 'has the number of doctors that work at the hospital' do
      visit "/hospitals/#{@hospital_1.id}"

      expect(page).to have_content("Count of Doctors: 5")
      expect(page).to_not have_content("Count of Doctors: 2")
    end

    it 'has a unique list of universities the doctors attended' do
      visit "/hospitals/#{@hospital_1.id}"

      expect(page).to have_content("University 1", count: 1)
      expect(page).to have_content("University 2", count: 1)
      expect(page).to have_content("University 3", count: 1)
      expect(page).to_not have_content("University 4")
      expect(page).to_not have_content("University 5")
    end
  end
end
