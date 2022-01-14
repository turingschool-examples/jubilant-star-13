require 'rails_helper'

RSpec.describe 'doctors/show.html.erb', type: :feature do
  let!(:hosp_1) { Hospital.create!(name: 'hosp_1') }
  let!(:hosp_2) { Hospital.create!(name: 'hosp_2') }

  let!(:doc_1) { Doctor.create!(name: 'doc_1', specialty: 'spec_1', university: 'uni_1', hospital: hosp_1) }
  let!(:doc_2) { Doctor.create!(name: 'doc_2', specialty: 'spec_2', university: 'uni_2', hospital: hosp_2) }

  let!(:pat_1) { Patient.create!(name: 'pat_1', age: 1) }
  let!(:pat_2) { Patient.create!(name: 'pat_2', age: 2) }
  let!(:pat_3) { Patient.create!(name: 'pat_3', age: 3) }
  let!(:pat_4) { Patient.create!(name: 'pat_4', age: 4) }
  
  let!(:doc_pat_1) { DoctorPatient.create!(doctor: doc_1, patient: pat_1) }
  let!(:doc_pat_2) { DoctorPatient.create!(doctor: doc_1, patient: pat_2) }
  let!(:doc_pat_3) { DoctorPatient.create!(doctor: doc_2, patient: pat_4) }
  let!(:doc_pat_4) { DoctorPatient.create!(doctor: doc_1, patient: pat_3) }

  before(:each) { visit doctor_path(doc_1) }

  context 'as a visitor' do
    describe 'viewable page elements' do
      it 'displays the specific doctors name, specialty, and university' do
        expect(page).to have_content(doc_1.name)
        expect(page).to have_content(doc_1.specialty)
        expect(page).to have_content(doc_1.university)

        expect(page).to have_no_content(doc_2.name)
        expect(page).to have_no_content(doc_2.specialty)
        expect(page).to have_no_content(doc_2.university)
      end

      it 'displays the doctors hospital they work at' do
        expect(page).to have_content(doc_1.hospital.name)
        expect(page).to have_no_content(doc_2.hospital.name)
      end

      it 'displays a list of the doctors patients' do
        expect(page).to have_content(pat_1.name)
        expect(page).to have_content(pat_2.name)
        expect(page).to have_content(pat_3.name)
        expect(page).to have_no_content(pat_4.name)
      end
    end
  end
end