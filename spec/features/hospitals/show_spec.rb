require 'rails_helper'

describe 'hospital show' do
  before do
    @hospital = Hospital.create(name: 'St. Jude')
    @not_our_hospital = Hospital.create(name: 'Some random hospital')

    @doctor1 = Doctor.create(name: 'Strange', specialty: 'Head/Shoulders', university: 'Marvel', hospital_id: @hospital.id)
    @doctor2 = Doctor.create(name: 'Suess', specialty: 'Knees/Toes', university: 'RhymeTime', hospital_id: @hospital.id)
    @doctor3 = Doctor.create(name: 'Octavis', specialty: 'Knees/Toes', university: 'Marvel', hospital_id: @hospital.id)
    @not_our_doctor = Doctor.create(name: 'Phil', specialty: 'nothing', university: 'unknown', hospital_id: @not_our_hospital.id)
    visit hospital_path(@hospital)
  end

  describe 'display' do
    it 'name' do
      expect(page).to have_content(@hospital.name)
      expect(page).to_not have_content(@not_our_hospital.name)
    end

    it 'number of doctors that work here' do
      expect(page).to have_content("Number of doctors at this hospital: 3")
    end

    it 'unique list of universities that doctors of this hospital attended' do
      within '#education' do
        expect(page).to have_content('Marvel')
        expect(page).to have_content('RhymeTime')
      end
    end
  end 
end