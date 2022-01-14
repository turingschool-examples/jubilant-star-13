require 'rails_helper'


# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

RSpec.describe 'the Hospital show page', type: :feature do

  before(:each) do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Hells Pass Hospital')
    @doctor = @hospital.doctors.create!(name: 'Joe Schmoe', specialty: 'General Surgery', university: "Stanford University")
    @doctor_1 = @hospital.doctors.create!(name: 'Moe Schmoe', specialty: 'Dentist', university: "University")
    @doctor_2 = @hospital.doctors.create!(name: 'John Smith', specialty: 'Physical Therapist', university: "Generic University")
    @doctor_3 = @hospital_2.doctors.create!(name: 'Jim Jones', specialty: 'Physical Therapist', university: "Colorado University")

    @patient_1 = Patient.create!(name: 'Jane Schmoe', age: 28)
    @patient_2 = Patient.create!(name: 'Moe Howard', age: 48)
    @patient_3 = Patient.create!(name: 'James Smith', age: 48)

    @doctor.patients << @patient_1
    @doctor.patients << @patient_2

  end

  it 'shows the hospitals name' do
    visit hospital_path(@hospital)
    expect(page).to have_content(@hospital.name)
  end

  it 'shows the number of doctors that work at the specific hospital' do
    visit hospital_path(@hospital)
    expect(page).to have_content("Number of doctors employed to this hospital: 3")
  end

  it 'lists the unique list of universities that this hospitals doctors attended' do
    visit hospital_path(@hospital)
    expect(page).to have_content(@doctor.university)
    expect(page).to have_content(@doctor_1.university)
    expect(page).to have_content(@doctor_2.university)
    expect(page).to_not have_content(@doctor_3.university)
  end


end
