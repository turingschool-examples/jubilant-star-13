require 'rails_helper'

RSpec.describe "Doctor show page", type: :feature do 

  it "has all of this specified doctor's info incl. name, specialty, university" do 
    # As a visitor
    # When I visit a doctor's show page
    # I see all of that doctor's information including:
    #  - name
    #  - specialty
    #  - university where they got their doctorate
    # And I see the name of the hospital where this doctor works
    # And I see the names of all of the patients this doctor has

    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @doctor1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", univeristy: "Harvard University", hospital_id: @hospital1.id)
    @doctor2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatrics", univeristy: "Washington State University", hospital_id: @hospital1.id)

    visit doctor_path(@doctor1)

    expect(page).to have_content("Name: Meredith Grey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("University: Harvard University")

    expect(page).to_not have_content("Name: Alex Karev")
    expect(page).to_not have_content("Specialty: Pediatrics")
    expect(page).to_not have_content("University: Washington State University")
  end

  it "has the name of the hospital where this doctor works" do 
  end

  it "has the names of all the patients for this doctor"

end
