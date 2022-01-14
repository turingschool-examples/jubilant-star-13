require 'rails_helper'

RSpec.describe 'Patient index page' do
  it "list all the patient names" do
    patients = create_list(:patients, 8)
    bob = create(:patient, name:'Bob')
    terry = create(:patient, name:'Terry')

    visit "/patients"

    within "div.patients" do
      expect(page).to have_content('Bob')
      expect(page).to have_content('Terry')
    end
  end

  it "lists all patients from oldest to youngest" do
    patients = create_list(:patients, 8)
    bob = create(:patient, name:'Bob', age: 105)
    terry = create(:patient, name:'Terry', age: 6)

    visit '/patients'
    within "div.patients" do
      expect('Bob').to appear_before('Terry')
    end
  end

  it "lists the age of each patient" do
    patients = create_list(:patients, 8)
    bob = create(:patient, name:'Bob', age: 105)
    terry = create(:patient, name:'Terry', age: 6)

    visit '/patients'
    within "div.patient_#{bob.id}" do
      expect(page).to have_content('Age: 105')
    end
  end
end
