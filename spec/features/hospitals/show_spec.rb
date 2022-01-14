require 'rails_helper'

RSpec.describe 'Hospital Show Page', type: :feature do
  let!(:hospital_1) {Hospital.create!(name: "St. Mary's")}
  let!(:hospital_2) {Hospital.create!(name: "Hospital 2")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Grey Bones", specialty: "OB/GYN", university: "Vanderbilt Medical School")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. House", specialty: "Psychology", university: "Yale Medical")}
  let!(:doctor_3) {hospital_2.doctors.create!(name: "Dr. Bill", specialty: "Ontology", university: "UCLA")}

  before(:each) do
    visit(hospital_path(hospital_1.id))
  end

  context 'When I visit a hospital show page' do
    scenario 'I see the hospital name' do
      expect(page).to have_content(hospital_1.name)
      expect(page).to have_no_content(hospital_2.name)
    end

    scenario 'I see number of doctors working at hospital' do
      within '#number_doctors' do
        expect(page).to have_content(hospital_1.doctors.count)
      end
    end

    scenario 'I see a unique list of universities the hospital doctors have attended' do
      within '#doctor_universities' do
        expect(page).to have_content(doctor_1.university)
        expect(page).to have_content(doctor_2.university)
        expect(page).to have_no_content(doctor_3.university)
      end
    end
  end
end
