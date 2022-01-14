require 'rails_helper'

RSpec.describe "Hospital Show" do
  it "When I visit the show, I see the hospital name, number of dr's that work here, and a unique list of universities they attended" do
    hospital = Hospital.create!(name: "Paul's Hospital")
    doctor1 = hospital.doctors.create!(name: "Dr. Mike", specialty: "Coding Doctor", university: "Turing")
    doctor2 = hospital.doctors.create!(name: "Dr. Paul", specialty: "Coding Doctor", university: "Turing")
    doctor3 = hospital.doctors.create!(name: "Dr. Mom", specialty: "Coding Doctor", university: "Not Turing")

    visit "/hospitals/#{hospital.id}"

    expect(page).to have_content(hospital.name)
    expect(page).to have_content("Number of Doctors: 3")
    expect(page).to have_content("Turing")
    expect(page).to have_content("Not Turing")
  end
end
