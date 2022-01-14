require 'rails_helper'

RSpec.describe "Doctor show page" do
  before :each do
    @h1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @h2 = Hospital.create!(name: "Black Swan Memorial Hospital")

    @d1 = @h1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @d2 = @h1.doctors.create!(name: "Gray Anatomy", specialty: "Plastic Surgery", university: "Doctor University")
    @d3 = @h1.doctors.create!(name: "John Smith", specialty: "Pediatrist", university: "Harvard University")

    @p1 = Patient.create!(name: "Marley Johanson", age: 37)
    @p2 = Patient.create!(name: "Jones Johanson", age: 40)
    @p3 = Patient.create!(name: "Tyler Smith", age: 30)
    @p4 = Patient.create!(name: "Dan McNeil", age: 33)
    @p5 = Patient.create!(name: "Wade Wilson", age: 45)

    @dp1 = DoctorPatient.create!(doctor: @d1, patient: @p1)
    @dp2 = DoctorPatient.create!(doctor: @d1, patient: @p2)
    @dp3 = DoctorPatient.create!(doctor: @d1, patient: @p3)
    @dp4 = DoctorPatient.create!(doctor: @d1, patient: @p4)
    @dp5 = DoctorPatient.create!(doctor: @d2, patient: @p1)
    @dp6 = DoctorPatient.create!(doctor: @d2, patient: @p5)
  end

  it 'shows all of a doctors information' do
    visit doctor_path(@d1)

    expect(page).to have_content(@d1.name)
    expect(page).to have_content(@d1.specialty)
    expect(page).to have_content(@d1.university)
    expect(page).to_not have_content(@d2.name)
  end

  it 'has the hospital name for the doctor' do
    visit doctor_path(@d1)

    expect(page).to have_content(@h1.name)
    expect(page).to_not have_content(@h2.name)
  end

  it 'has the name of all the doctors patients' do
    visit doctor_path(@d1)

    expect(page).to have_content(@p1.name)
    expect(page).to have_content(@p2.name)
    expect(page).to have_content(@p3.name)
    expect(page).to have_content(@p4.name)
    expect(page).to_not have_content(@p5.name)
  end

  it 'does not break if no patients' do
    visit doctor_path(@d3)

    within("#patients") do
      expect(page).to have_no_content
    end
  end
end
