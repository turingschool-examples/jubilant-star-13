require 'rails_helper'

RSpec.describe "Hospital show page", type: :feature do 

  it "has hospital's name, number of doctors that work there" do 
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = Doctor.create!(name: "Calliope Torres", specialty: "Orthopedics", university: "UC Berkeley Medical School", hospital_id: hospital1.id)
    doctor2 = Doctor.create!(name: "Owen Hunt", specialty: "Trauma Surgery", university: "UC Berkeley Medical School", hospital_id: hospital1.id)
    doctor3 = Doctor.create!(name: "Mark Sloane", specialty: "Plastic Surgery", university: "LA Med", hospital_id: hospital1.id)

    visit hospital_path(hospital1)

    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Doctors: 3")
    expect(page).to have_content("UC Berkeley Medical School \n LA Med")
  end


  it "has a unique list of universities this hospital's doctors attended" do
  end

end
