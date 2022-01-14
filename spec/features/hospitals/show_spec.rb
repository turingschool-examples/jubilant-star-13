require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  it "shows hospital info" do
    sloans = Hospital.create!({name: "Grey Sloan Memorial Hospital"})

    visit "/hospitals/#{sloans.id}"

    expect(page).to have_content(sloans.name)
  end
end
# User Story 2, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
