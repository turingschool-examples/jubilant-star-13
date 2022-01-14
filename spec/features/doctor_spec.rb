require 'rails_helper'

RSpec.describe 'doctor show page' do

  before(:each) do
    @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @meredith = @grey_sloan.doctors.create!(name: "Meredith Grey", specialty: "General", university: "Dartmouth University")
  
  end
  scenario 'visitor sees all doctor attributes' do
    visit "/doctors/#{@meredith.id}"
    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.university)
  end
end