require 'rails_helper'

RSpec.describe 'Doctor Show Page' do

  before(:each) do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

    @doctor_1 = Doctor.create!(name: 'Doctor Strange', specialty: 'General Surgery', university: 'Stanford university', hospital_id: @hospital.id)
    @doctor_2 = Doctor.create!(name: 'Doctor Jenner', specialty: 'Brain Surgery', university: 'Harvard university', hospital_id: @hospital.id)

    @patient_1 = Patient.create!(name: 'Patient', age: '50')
    @patient_2 = Patient.create!(name: 'John', age: '25')
    @patient_3 = Patient.create!(name: 'Josue', age: '18')
    @patient_4 = Patient.create!(name: 'Sam', age: '43')

    PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_2.id)
    PatientDoctor.create!(patient_id: @patient_4.id, doctor_id: @doctor_2.id)

    visit "/doctors/#{@doctor_1.id}"
  end

  it 'displays the doctors attributes' do
    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)
  end

  it 'doesnt display other doctors attributes' do
    expect(page).to_not have_content(@doctor_2.name)
    expect(page).to_not have_content(@doctor_2.specialty)
    expect(page).to_not have_content(@doctor_2.university)
  end

  it 'displays the name of the hospital this doctor works at' do
    expect(page).to have_content(@doctor_1.hospital.name)
  end

  it 'displays the names of all the patients this doctor has' do
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_3.name)
  end

  it 'doesnt display patients this doctor doesnt have' do
    expect(page).to_not have_content(@patient_4.name)
  end

  it 'displays a button next to each patient name to remove that patient from doctors caseload' do
    within "#patient-#{@patient_2.id}" do
      expect(page).to have_button("Remove Patient")
    end
  end

  it 'takes you to correct path when the remove patient button is clicked' do
    within "#patient-#{@patient_2.id}" do
      click_button("Remove Patient")
    end

    expect(current_path).to eq("/doctors/#{@doctor_1.id}")
  end

  it 'removes a patient when the remove patient button is clicked' do
    expect(page).to have_content(@patient_2.name)

    within "#patient-#{@patient_2.id}" do
      click_button("Remove Patient")
    end

    expect(page).to_not have_content(@patient_2.name)
  end

end
