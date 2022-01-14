require 'rails_helper'

RSpec.describe 'patients/index.html.erb', type: :feature do
  let!(:pat_1) { Patient.create!(name: 'pat_1', age: 1) }
  let!(:pat_2) { Patient.create!(name: 'pat_2', age: 2) }
  let!(:pat_3) { Patient.create!(name: 'pat_3', age: 3) }
  let!(:pat_4) { Patient.create!(name: 'pat_4', age: 4) }

  before(:each) { visit patients_path }

  describe 'as a visitor' do
    describe 'viewable page elements' do
      it 'displays a list of all patients names' do
        expect(page).to have_content(pat_1.name)
        expect(page).to have_content(pat_2.name)
        expect(page).to have_content(pat_3.name)
        expect(page).to have_content(pat_4.name)
      end

      it 'displays a list of all patients in oldest to youngest order' do
        expect(pat_4.name).to appear_before(pat_3.name)
        expect(pat_4.name).to appear_before(pat_2.name)
        expect(pat_4.name).to appear_before(pat_1.name)
        expect(pat_3.name).to appear_before(pat_2.name)
        expect(pat_3.name).to appear_before(pat_1.name)
        expect(pat_2.name).to appear_before(pat_1.name)
      end
    end
  end
end