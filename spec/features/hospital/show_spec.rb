require 'rails_helper'

RSpec.describe 'hospital show page' do
  let!(:hospital_1) { Hospital.create!(name: "Hospital 1")}

  let!(:doc_1) { Doctor.create!(name: "Doc 1", specialty: "special 1", university: "University 1", hospital_id: hospital_1.id)}
  let!(:doc_2) { Doctor.create!(name: "Doc 2", specialty: "special 2", university: "University 2", hospital_id: hospital_1.id)}
  let!(:doc_3) { Doctor.create!(name: "Doc 3", specialty: "special 3", university: "University 2", hospital_id: hospital_1.id)}

  it "checks we are on the right page" do
    visit "/hospitals/#{hospital_1.id}"
  end

  it "checks that the page has the hospitals name" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content(hospital_1.name)
  end

  it "shows the number of doctors assigned to the hospital" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content("Number of doctors: 3")
  end

  it "shows a uniq list of hospitals" do
    visit "/hospitals/#{hospital_1.id}"
    expect(page).to have_content("University 1")
    expect(page).to have_content("University 2")
  end
end
