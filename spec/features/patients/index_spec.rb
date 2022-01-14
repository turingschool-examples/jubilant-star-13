require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  it 'displays all paitients in order from oldest to youngest' do
    geoff = Patient.create!(name: "Geoff Banks", age: 34)
    wilson = Patient.create!(name: "Wilson General", age: 44)
    sharina = Patient.create!(name: "Sharina Triss", age: 22)
    visit '/patients'
    
    expect(page).to have_content("Patient Index")
    expect("Wilson General").to appear_before("Geoff Banks")
    expect("Geoff Banks").to appear_before("Sharina Triss")
  end
end
