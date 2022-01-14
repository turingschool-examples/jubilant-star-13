require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  it "shows doctor info" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})

    miranda = sloans.doctors.create!({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"})
    derrick = sloans.doctors.create!({name: "Derrick Shepard", specialty: "Brain Surgery", university: "Harvard University"})

    visit "/doctors/#{miranda.id}"

    expect(page).to_not have_content(derrick.name)
    expect(page).to have_content(miranda.name)
    expect(page).to have_content(miranda.specialty)
    expect(page).to have_content(miranda.university)
  end

  it "shows the name of their hospital" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
    other = Hospital.create!({name: "The Other Hospital"})

    miranda = sloans.doctors.create!({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"})
    derrick = sloans.doctors.create!({name: "Derrick Shepard", specialty: "Brain Surgery", university: "Harvard University"})

    visit "/doctors/#{miranda.id}"

    expect(page).to have_content(sloans.name)
    expect(page).to_not have_content(other.name)
  end

  it "shows the names of their patients" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
    other = Hospital.create!({name: "The Other Hospital"})

    miranda = sloans.doctors.create!({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"})
    derrick = sloans.doctors.create!({name: "Derrick Shepard", specialty: "Brain Surgery", university: "Harvard University"})

    denny = miranda.patients.create!({name: "Denny Duquette", age: 39})
    elvis = miranda.patients.create!({name: "Elvis Presley", age: 49})
    mandy = miranda.patients.create!({name: "Mandy Moore", age: 49})
    bonnie = derrick.patients.create!({name: "Bonnie Jones", age: 20})

    visit "/doctors/#{miranda.id}"

    expect(page).to have_content(denny.name)
    expect(page).to have_content(elvis.name)
    expect(page).to have_content(mandy.name)
    expect(page).to_not have_content(bonnie.name)

  end
end

# User Story 3, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
#
# NOTE: the patient record should not be deleted entirely
