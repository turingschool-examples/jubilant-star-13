require 'rails_helper'

RSpec.describe 'hospitals/show.html.erb', type: :feature do
  let!(:hosp_1) { Hospital.create!(name: 'hosp_1') }
  let!(:hosp_2) { Hospital.create!(name: 'hosp_2') }

  let!(:doc_1) { Doctor.create!(name: 'doc_1', specialty: 'spec_1', university: 'uni_1', hospital: hosp_1) }
  let!(:doc_2) { Doctor.create!(name: 'doc_2', specialty: 'spec_2', university: 'uni_2', hospital: hosp_2) }
  let!(:doc_3) { Doctor.create!(name: 'doc_3', specialty: 'spec_3', university: 'uni_3', hospital: hosp_1) }
  let!(:doc_4) { Doctor.create!(name: 'doc_4', specialty: 'spec_4', university: 'uni_1', hospital: hosp_1) }

  let!(:pat_1) { Patient.create!(name: 'pat_1', age: 1) }
  let!(:pat_2) { Patient.create!(name: 'pat_2', age: 2) }
  let!(:pat_3) { Patient.create!(name: 'pat_3', age: 3) }
  let!(:pat_4) { Patient.create!(name: 'pat_4', age: 4) }
  
  let!(:doc_pat_1) { DoctorPatient.create!(doctor: doc_1, patient: pat_1) }
  let!(:doc_pat_2) { DoctorPatient.create!(doctor: doc_1, patient: pat_2) }
  let!(:doc_pat_3) { DoctorPatient.create!(doctor: doc_2, patient: pat_4) }
  let!(:doc_pat_4) { DoctorPatient.create!(doctor: doc_1, patient: pat_3) }

  before(:each) { visit hospital_path(hosp_1) }

  describe 'as a visitor' do
    describe 'viewable page elements' do
      it 'displays the hospital name' do
        expect(page).to have_content(hosp_1.name)
        expect(page).to have_no_content(hosp_2.name)
      end

      it 'displays the number of doctors that work at the hospital' do
        expect(page).to have_content("Number of Doctors: #{hosp_1.doctor_count}")
      end

      it 'displays unique list of doctors universities' do
        expect(page).to have_content(doc_1.university, count: 1)
        expect(page).to have_content(doc_3.university, count: 1)
        expect(page).to have_no_content(doc_2.university)
      end
    end
  end
end