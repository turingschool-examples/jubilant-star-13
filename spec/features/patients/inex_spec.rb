require 'rails_helper'

describe 'patients index page' do
  it "I see doctors attributes" do
    patient1 = Patient.create!(name: 'katie', age: 28)
    patient2 = Patient.create!(name: 'gus', age: 2)
    patient3 = Patient.create!(name: 'tracy', age: 40)
    visit patients_path

    expect(patient3.name).to appear_before(patient1.name)
    expect(patient1.name).to appear_before(patient2.name)
  end
end
