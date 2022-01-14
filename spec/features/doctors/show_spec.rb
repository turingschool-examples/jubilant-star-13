require 'rails_helper'

RSpec.describe 'doctor show page' do

  before(:each) do
    @grey_sloan = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @meredith = @grey_sloan.doctors.create!(name: "Meredith Grey", specialty: "General", university: "Dartmouth University")
    @bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General", university: "Stanford University")
    @david = @meredith.patients.create!(name: "David Hamilton", age: 67)
    @harper = @meredith.patients.create!(name: "Harper Avery", age: 72)
    @nick = @meredith.patients.create!(name: "Nick Marsh", age: 45)
    @mary = @bailey.patients.create!(name: "Mary Porter", age: 35)
  
  end
  scenario 'visitor sees all doctor attributes' do
    visit "/doctors/#{@meredith.id}"
    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.university)
  end

  scenario 'visitor sees the name of the hospital where the doctor works' do
    visit "/doctors/#{@meredith.id}"
    expect(page).to have_content(@grey_sloan.name)
  end

  scenario 'visitor sees names of all doctors current patients' do
    visit "/doctors/#{@meredith.id}"
    expect(page).to have_content(@david.name)
    expect(page).to have_content(@harper.name)
    expect(page).to have_content(@nick.name)
    expect(page).to_not have_content(@mary.name)
  end

  scenario 'visitor sees button next to patients name and ' do
    visit "/doctors/#{@meredith.id}"
    expect(page).to have_button "Remove Patient"
    within "#patient#{@david.id}" do
      click_button "Remove Patient"
    expect(current_path).to eq("/doctors/#{@meredith.id}")
    end
  end

  # "/doctors/#{@meredith.id}/patients/#{@david.id}"

end