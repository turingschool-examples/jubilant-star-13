require 'rails_helper'

RSpec.describe 'Patient Index spec' do
  it 'visits Patient Index page and sees the name of all patients listed from oldest to youngest' do
    patient1 = Patient.create!(name: 'patient1', age: 1)
    patient2 = Patient.create!(name: 'patient2', age: 2)
    patient3 = Patient.create!(name: 'patient3', age: 3)

    visit patients_path

    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to have_content(patient3.name)

    expect(patient3.name).to appear_before(patient2.name)
    expect(patient2.name).to appear_before(patient1.name)
    expect(patient3.name).to appear_before(patient1.name)
  end
end
