require 'rails_helper'

RSpec.describe 'hospital show page' do
  let!(:hospital_1) { Hospital.create!(name: "Hospital 1")}
  let!(:hospital_2) { Hospital.create!(name: "Hospital 2")}

  it "checks we are on the right page" do
    visit "/hospitals/#{hospital_1.id}"
  end

  it "checks that the page has the hospitals name" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content(hospital_1.name)
  end
end
