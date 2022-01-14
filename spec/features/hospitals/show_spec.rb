require 'rails_helper'

RSpec.describe 'Hospitals Show Page' do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Turing Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor Turing", specialty: "ENT", university: "Turing Medical School")
    @doctor2 = @hospital1.doctors.create!(name: "Doctor Medical", specialty: "Surgery", university: "Different Medical School")
    @doctor3 = @hospital1.doctors.create!(name: "Doctor SoAndSo", specialty: "Brains", university: "Traditional Medical School")
    @doctor4 = @hospital1.doctors.create!(name: "Doctor Expert", specialty: "Knees", university: "Untraditional Medical School")

    visit "/hospitals/#{@hospital1.id}"
  end

  describe 'when I visit the Hospital Show Page' do
    it 'has the hospitals name' do
      expect(page).to have_content(@hospital1.name)
    end

    it 'has the number of doctors that work at this hospital' do
      expect(page).to have_content("Number of doctors who work here: 4")
    end

    it 'lists the universities that this hospitals doctors attended' do
      expect(page).to have_content(@doctor1.university)
      expect(page).to have_content(@doctor2.university)
      expect(page).to have_content(@doctor3.university)
      expect(page).to have_content(@doctor4.university)
    end
  end
end
