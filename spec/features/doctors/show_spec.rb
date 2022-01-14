require 'rails_helper'

RSpec.describe 'Doctors show page' do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Turing Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor Turing", specialty: "ENT", university: "Turing Medical School")

    visit "/doctors/#{@doctor1.id}"
  end

  describe 'when I visit the doctor show page' do
    it 'shows the doctors information including name, specialty, and university' do
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content(@doctor1.university)
    end

    it 'shows me the name of the hospital where the doctor works' do

    end

    it 'shows the names of all of the patients this doctor has' do

    end
  end
end
