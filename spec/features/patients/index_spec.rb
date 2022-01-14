require 'rails_helper'

RSpec.describe "Patients Index Page", type: :feature do 

  it "has all patients listed, oldest to youngest" do 
    patient1 = Patient.create!(name: "Jimmy", age:7)
    patient2 = Patient.create!(name: "Edward", age:16)
    patient3 = Patient.create!(name: "Bill", age:40)
    patient4 = Patient.create!(name: "Evelyn", age:60)

    visit patients_path

    expect(page).to have_content("Evelyn\nBill\nEdward\nJimmy")

    expect(patient4.name).to appear_before(patient3.name)
    expect(patient3.name).to appear_before(patient2.name)
    expect(patient2.name).to appear_before(patient1.name)
    expect(patient3.name).to appear_before(patient1.name)
  end

end
