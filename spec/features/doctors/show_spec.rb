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

    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital1.id)
    doctor2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Washington State University", hospital_id: hospital1.id)

    visit doctor_path(doctor1)

    expect(page).to have_content("Name: Meredith Grey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("University: Harvard University")

    expect(page).to_not have_content("Name: Alex Karev")
    expect(page).to_not have_content("Specialty: Pediatrics")
    expect(page).to_not have_content("University: Washington State University")
  end

  it "has the name of the hospital where this doctor works" do 
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital1.id)
    doctor2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Washington State University", hospital_id: hospital1.id)

    visit doctor_path(doctor1)

    expect(page).to have_content("Hospital: Grey Sloan Memorial Hospital")
  end

  it "has the names of all the patients for this doctor" do
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: hospital1.id)
    doctor2 = Doctor.create!(name: "Christina Yang", specialty: "Pediatrics", university: "Yale Medical School", hospital_id: hospital1.id)

    patient1 = Patient.create!(name: "Derek Shepherd", age: 38)
    doctor2.patients << patient1

    patient2 = Patient.create!(name: "Henry Collins", age: 40)
    doctor2.patients << patient2

    patient3 = Patient.create!(name: "Amber Hatch", age: 18)
    doctor1.patients << patient3

    visit doctor_path(doctor2)
    
    within ".doctor-#{doctor2.id}-patients" do
      expect(page).to have_content("Derek Shepherd, 38")
      expect(page).to have_content("Henry Collins, 40")
    end

    expect(page).to_not have_content("Amber Hatch, 18")

  end

end
