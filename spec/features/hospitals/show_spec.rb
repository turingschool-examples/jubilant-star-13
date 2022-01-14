require 'rails_helper'

RSpec.describe 'hospital show page' do

  before(:each) do
    @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @mayo_clinic = Hospital.create!(name: "Mayo Clinic")
    @meredith = @grey_sloan.doctors.create!(name: "Meredith Grey", specialty: "General", university: "Dartmouth University")
    @bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General", university: "Stanford University")
    @david_hamilton = @mayo_clinic.doctors.create!(name: "David Hamilton", specialty: "Neurosurgery", university: "Harvard University")
  
    visit "/hospitals/#{@grey_sloan.id}"
  end

  scenario 'visitor sees hospital name, number of doctors that work at that hospital' do
    expect(page).to have_content(@grey_sloan.name)
    expect(page).to_not have_content(@mayo_clinic.name)
    expect(page).to have_content(@grey_sloan.doctors.count)
  end

  scenario 'visitor sees unique list of universities hospitals doctors attended' do
    expect(page).to have_content(@meredith.university)
    expect(page).to have_content(@bailey.university)
    expect(page).to_not have_content(@david_hamilton.university)
    save_and_open_page
  end
end 
