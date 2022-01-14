require 'rails_helper'

# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

RSpec.describe 'Hospital show page' do
  it 'I see the hospitals name' do

  @hosp_1 = Hospital.create!(name: 'mercy')
  @hosp_2 = Hospital.create!(name: 'grace')
  @hosp_3 = Hospital.create!(name: 'healing')

  visit "/hospitals/#{@hosp_2.id}"

  expect(page).to have_content(@hosp_2.name)
  expect(page).to_not have_content(@hosp_1.name)
  expect(page).to_not have_content(@hosp_3.name)
  end

  it 'I see the number of doctors that work at this hospital' do
    @hosp_1 = Hospital.create!(name: 'mercy')
    @hosp_2 = Hospital.create!(name: 'grace')
    @hosp_3 = Hospital.create!(name: 'healing')

    @doc_1 = @hosp_1.doctors.create!(name: 'Doctor one', specialty: 'Brains', university: 'first state')
    @doc_2 = @hosp_2.doctors.create!(name: 'Doctor two', specialty: 'Hands', university: 'second state')
    @doc_3 = @hosp_3.doctors.create!(name: 'Doctor three', specialty: 'Backs', university: 'third state')

    visit "/hospitals/#{@hosp_3.id}"

    expect(page).to have_content("number of doctors 1")
  end

  it 'I see a unique list of universities that this hospitals doctors attended' do
    @hosp_1 = Hospital.create!(name: 'mercy')
    @hosp_2 = Hospital.create!(name: 'grace')
    @hosp_3 = Hospital.create!(name: 'healing')

    @doc_1 = @hosp_3.doctors.create!(name: 'Doctor one', specialty: 'Brains', university: 'first state')
    @doc_2 = @hosp_3.doctors.create!(name: 'Doctor two', specialty: 'Hands', university: 'second state')
    @doc_3 = @hosp_3.doctors.create!(name: 'Doctor three', specialty: 'Backs', university: 'first state')

    visit "/hospitals/#{@hosp_3.id}"

    expect(page).to have_content(@doc_1.university)
    expect(page).to have_content(@doc_2.university)
    expect(page).to have_content(@doc_3.university)
  end
end