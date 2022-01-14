require 'rails_helper'

RSpec.describe 'Hospital Show Page' do

  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @hospital_2 = Hospital.create!(name: 'Childrens Hospital')

    @doctor_1 = Doctor.create!(name: 'Doctor Strange', specialty: 'General Surgery', university: 'Stanford university', hospital_id: @hospital_1.id)
    @doctor_2 = Doctor.create!(name: 'Doctor Jenner', specialty: 'Brain Surgery', university: 'Harvard university', hospital_id: @hospital_1.id)
    @doctor_3 = Doctor.create!(name: 'Doctor Hash', specialty: 'Doctor Stuff', university: 'Some university', hospital_id: @hospital_2.id)
    @doctor_4 = Doctor.create!(name: 'Doctor String', specialty: 'Orthopedics', university: 'Harvard university', hospital_id: @hospital_2.id)

    @patient_1 = Patient.create!(name: 'Patient', age: '50')
    @patient_2 = Patient.create!(name: 'John', age: '25')
    @patient_3 = Patient.create!(name: 'Josue', age: '18')
    @patient_4 = Patient.create!(name: 'Sam', age: '43')

    PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_1.id)
    PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_2.id)
    PatientDoctor.create!(patient_id: @patient_4.id, doctor_id: @doctor_2.id)

    visit "/hospitals/#{@hospital_1.id}"
  end

  it 'displays the hospitals name' do
    expect(page).to have_content(@hospital_1.name)
  end

  it 'doesnt display other hospital names' do
    expect(page).to_not have_content(@hospital_2.name)
  end

  it 'displays the number of doctors that work at this hospital' do
    expect(page).to have_content("Doctors: 2")
  end

  it 'displays a unique list of universities that this hospitals doctors attended' do
    expect(page).to have_content("Stanford university")
    expect(page).to_not have_content("Harvard university")
    expect(page).to_not have_content("Some university")
  end

end
