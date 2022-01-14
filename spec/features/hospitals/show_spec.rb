require 'rails_helper'

RSpec.describe "hospital show page" do
  it "displays the hospital name" do
    hospital = create(:hospital, name: 'yay')

    visit(hospital_path(hospital))

    expect(page).to have_content('yay')
  end

  it "displays the number of doctors who work at this hospital" do
    hospital = create(:hospital)
    doctor_1 = create_list(:doctor, 5, hospital: hospital)

    visit(hospital_path(hospital))

    expect(page).to have_content("Doctors at #{hospital.name}: 5")
  end

  it "shows a unique list of universities that it's doctors attended" do
    hospital = create(:hospital)
    doctor_1 = create(:doctor, hospital: hospital, university: "Yale")
    doctor_2 = create(:doctor, hospital: hospital, university: "Yale")
    doctor_3 = create(:doctor, hospital: hospital, university: "Harvard")
    doctor_4 = create(:doctor, hospital: hospital, university: "Princeton")

    visit(hospital_path(hospital))

    within "div.universities" do
      expect(page).to have_content('Yale')
      expect(page).to have_content('Harvard')
      expect(page).to have_content('Princeton')
    end
  end
end
