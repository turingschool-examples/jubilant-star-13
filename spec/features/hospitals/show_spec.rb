require 'rails_helper'

describe 'hospitals show page' do
  it "I see hospitals name" do
    hosp1 = Hospital.create!(name: 'sacred heart')
    hosp2 = Hospital.create!(name: 'hells pass')
    visit "/hospitals/#{hosp1.id}"

    expect(page).to have_content(hosp1.name)
    expect(page).to_not have_content(hosp2.name)
  end
  it "I see the number of doctors that work at a hostpital" do
    hosp1 = Hospital.create!(name: 'sacred heart')
    hosp2 = Hospital.create!(name: 'hells pass')
    doc1 = hosp1.doctors.create!(name: 'wade', specialty: 'medicine', university: 'u of d')
    doc2 = hosp1.doctors.create!(name: 'brett', specialty: 'love', university: 'wilm u')
    visit "/hospitals/#{hosp1.id}"

    expect(page).to have_content("Number of doctors: 2")
  end
end
