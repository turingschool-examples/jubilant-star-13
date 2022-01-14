require 'rails_helper'

RSpec.describe 'the hospital show page' do

  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @general_hospital = Hospital.create!(name: "Slide Park General Hospital")

    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @emerick = @hospital.doctors.create!(name: "Ed Emerick", specialty: "Pediatrics", university: "Univeristy of Michigan")
    @lagrange = @hospital.doctors.create!(name: "Barnard LaGrange", specialty: "Opthalmology", university: "University of Washington")

    @sutherland = @general_hospital.doctors.create!(name: "Travis Sutherland", specialty: "Podiatry", university: "University of Hard Knocks")
  end

  it 'displays pertinent info for one hospital' do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content(@hospital.name)
    expect(page).to have_content("Number of Doctors: 3")
    expect(page).to have_content(@bailey.university)
    expect(page).to have_content(@emerick.university)
    expect(page).to have_content(@lagrange.university)
  end

end
