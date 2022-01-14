require 'rails_helper'

describe 'doctor show page' do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'hospital_1')
    @doctor_1 = Doctor.create!(name: 'doctor_1', specialty: 'specialty_1', university: 'university_1', hospital_id: @hospital_1.id)
    @doctor_2 = Doctor.create!(name: 'doctor_2', specialty: 'specialty_2', university: 'university_2', hospital_id: @hospital_1.id)

    @patient_1 = Patient.create!(name: 'patient_1', age: 20)
    @patient_2 = Patient.create!(name: 'patient_2', age: 21)
    @patient_3 = Patient.create!(name: 'patient_3', age: 22)

    DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
    DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_3.id)
  end

  it "lists doctor info and patient names" do
    visit "/doctors/#{@doctor_1.id}"

    expect(page).to have_content("#{@doctor_1.name}")
    expect(page).to have_content("hospital_1")
    expect(page).to have_content("#{@doctor_1.university}")
    expect(page).to have_content("#{@doctor_1.specialty}")
    expect(page).to have_content("#{@patient_1.name}")
    expect(page).to have_content("#{@patient_2.name}")
    expect(page).to_not have_content("#{@patient_3.name}")
  end

  it "lists doctor info and patient names" do
    visit "/doctors/#{@doctor_1.id}"

    within("#patient-#{@patient_1.id}") do
      click_button('Remove')
    end

    expect(current_path).to eq("/doctors/#{@doctor_1.id}")
    expect(page).to_not have_content(@patient_1.name)
  end

end
