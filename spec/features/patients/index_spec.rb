require 'rails_helper'

RSpec.describe 'Patients Index Page', type: :feature do
  let!(:patient_1) {Patient.create!(name: 'Billy Ray', age: 43)}
  let!(:patient_2) {Patient.create!(name: 'Dolly Parton', age: 50)}
  let!(:patient_3) {Patient.create!(name: 'Michael Buble', age: 34)}
  let!(:patient_4) {Patient.create!(name: 'Stevie Ray Vaughn', age: 76)}

  context 'When I visit patient index page' do
    scenario 'I see names of all patients ordered youngest to oldest' do
      visit(patients_path)

      first  = find("#patient#{patient_3.id}")
      second = find("#patient#{patient_1.id}")
      third  = find("#patient#{patient_2.id}")
      fourth = find("#patient#{patient_4.id}")

      expect(first).to appear_before(second)
      expect(second).to appear_before(third)
      expect(third).to appear_before(fourth)
    end
  end
end
