require 'rails_helper'

RSpec.describe 'Doctor show page' do

let!(:hospital_1) { Hospital.create!(name: "Hospital 1")}

let!(:doc_1) { Doctor.create!(name: "Doc 1", specialty: "special 1", university: "University 1", hospital_id: hospital_1.id)}
let!(:doc_2) { Doctor.create!(name: "Doc 2", specialty: "special 2", university: "University 2", hospital_id: hospital_1.id)}

  it "checks we are on the right page" do
    visit "/doctors/#{doc_1.id}"
  end

  it "checks that the page has the doctors informaition" do
    visit "/doctors/#{doc_1.id}"
    expect(page).to have_content(doc_1.name)
    expect(page).to have_content(doc_1.specialty)
    expect(page).to have_content(doc_1.university)
  end
end
