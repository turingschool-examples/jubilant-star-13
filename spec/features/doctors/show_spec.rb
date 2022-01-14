require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  it "shows doctor info" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})

    miranda = sloans.doctors.create!({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University"})

    visit "/doctors/#{miranda.id}"

    expect(page).to have_content(miranda.name)
    expect(page).to have_content(miranda.specialty)
    expect(page).to have_content(miranda.university)
  end
  it "shows the name of their hospital" do
  end
  it "shows the names of their patients" do
  end
end

# User Story 1, Doctors Show Page
# ​
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has


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
