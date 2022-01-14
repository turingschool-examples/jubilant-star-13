require 'rails_helper'

RSpec.describe 'patient index page' do
  let!(:denny) {Patient.create!(name: "Denny Duquette", age: 39)}
  let!(:bob) {Patient.create!(name: "Bob Duquette", age: 44)}
  let!(:larry) {Patient.create!(name: "Larry Duquette", age: 27)}

  it 'lists the names of all patients in order of age, oldest to youngest' do
    visit "/patients"

    expect(page).to have_content("Patients")
  
    expect(bob.name).to appear_before(denny.name)
    expect(denny.name).to appear_before(larry.name)
  end
end
