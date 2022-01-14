require 'rails_helper'

RSpec.describe 'Doctors show page' do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Turing Hospital")
    @doctor1 = @hospital.doctors.create!(name: "Doctor Turing", specialty: "ENT", university: "Turing Medical School")

    visit "/doctor/#{@doctor1.id}"
  end

  describe 'when I visit the doctor show page' do
    it 'shows the doctors information including name, specialty, and university' do
      
    end

    it 'shows me the name of the hospital where the doctor works' do

    end

    it 'shows the names of all of the patients this doctor has' do

    end
  end
end
