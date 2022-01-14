require 'rails_helper'

RSpec.describe 'the hospital show page' do

  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @general_hospital = Hospital.create!(name: "Slide Park General Hospital")

    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @emerick = @hospital.doctors.create!(name: "Ed Emerick", specialty: "Pediatrics", university: "Stanford University")
    @lagrange = @hospital.doctors.create!(name: "Barnard LaGrange", specialty: "Opthalmology", university: "University of Washington")
    @bellefort = @hospital.doctors.create!(name: "Bernice Bellefort", specialty: "Internal Medicine", university: "University of Washington")

    @sutherland = @general_hospital.doctors.create!(name: "Travis Sutherland", specialty: "Podiatry", university: "University of Hard Knocks")
  end

  it 'displays pertinent info for one hospital' do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content(@hospital.name)
    expect(page).to have_content("Number of Doctors: 4")
    expect(page).to have_content("Stanford University")
    expect(page).to have_content("University of Washington")

    expect(page).to_not have_content("Stanford University").twice
    expect(page).to_not have_content("University of Washington").twice
  end

end
