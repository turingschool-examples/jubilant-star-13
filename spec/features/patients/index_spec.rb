require "rails_helper"

describe 'patients index page' do
  before do
    @patient1 = Patient.create!(name:"Kelly", age: 25)
    @patient2 = Patient.create!(name:"Kara", age: 23)
    @patient3 = Patient.create!(name:"Josh", age: 29)
    @patient4 = Patient.create!(name:"Jana", age: 21)
    visit "/patients"
  end

  it 'I see the names of all patients listed from oldest to youngest' do
    expect(@patient3.name).to appear_before(@patient4.name)
    expect(@patient3.name).to appear_before(@patient2.name)
    expect(@patient3.name).to appear_before(@patient1.name)
  end
end
