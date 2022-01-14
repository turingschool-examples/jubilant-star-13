require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  it "shows hospital info" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
    other = Hospital.create!({name: "The Other Hospital"})

    visit "/hospitals/#{sloans.id}"

    expect(page).to have_content(sloans.name)
    expect(page).to_not have_content(other.name)
  end

  it "shows the number of doctors that work at this hospital" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
    other = Hospital.create!({name: "The Other Hospital"})

    miranda = sloans.doctors.create!({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"})
    derrick = sloans.doctors.create!({name: "Derrick Shepard", specialty: "Brain Surgery", university: "Harvard University"})
    christina = sloans.doctors.create!({name: "Christina Yang", specialty: "Heart Surgery", university: "Columbia University"})
    george = other.doctors.create!({name: "George O'Malley", specialty: "Foot Surgery", university: "Brown University"})

    visit "/hospitals/#{sloans.id}"

    expect(page).to have_content("Number of Doctor's: 3")
  end

  it "shows a unique list of universities that this hospital's doctors attended" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
    other = Hospital.create!({name: "The Other Hospital"})

    miranda = sloans.doctors.create!({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"})
    derrick = sloans.doctors.create!({name: "Derrick Shepard", specialty: "Brain Surgery", university: "Harvard University"})
    christina = sloans.doctors.create!({name: "Christina Yang", specialty: "Heart Surgery", university: "Columbia University"})
    george = other.doctors.create!({name: "George O'Malley", specialty: "Foot Surgery", university: "Brown University"})

    visit "/hospitals/#{sloans.id}"

    expect(page).to have_content(miranda.university)
    expect(page).to have_content(derrick.university)
    expect(page).to have_content(christina.university)
    expect(page).to_not have_content(george.university)
  end
end
