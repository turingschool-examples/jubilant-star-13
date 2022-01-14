require 'rails_helper'

RSpec.describe 'Doctor show page' do

let!(:hospital_1) { Hospital.create!(name: "Hospital 1")}
let!(:hospital_2) { Hospital.create!(name: "Hospital 2")}

let!(:doc_1) { Doctor.create!(name: "Doc 1", specialty: "special 1", university: "University 1", hospital_id: hospital_1.id)}
let!(:doc_2) { Doctor.create!(name: "Doc 2", specialty: "special 2", university: "University 2", hospital_id: hospital_1.id)}

let!(:patient_1) { Patient.create!(name: "Patient 1")}
let!(:patient_2) { Patient.create!(name: "Patient 2")}
let!(:patient_3) { Patient.create!(name: "Patient 3")}
let!(:patient_4) { Patient.create!(name: "Patient 4")}

let!(:doc_pat_1) {DoctorPatient.create!(doctor: doc_1, patient: patient_1)}
let!(:doc_pat_2) {DoctorPatient.create!(doctor: doc_1, patient: patient_2)}
let!(:doc_pat_3) {DoctorPatient.create!(doctor: doc_1, patient: patient_3)}
let!(:doc_pat_4) {DoctorPatient.create!(doctor: doc_2, patient: patient_4)}

  it "checks we are on the right page" do
    visit "/doctors/#{doc_1.id}"
  end

  it "checks that the page has the doctors informaition" do
    visit "/doctors/#{doc_1.id}"
    expect(page).to have_content(doc_1.name)
    expect(page).to have_content(doc_1.specialty)
    expect(page).to have_content(doc_1.university)
    expect(page).not_to have_content(doc_2.name)
  end

  it "shows the hospital the doctor works at" do
    visit "/doctors/#{doc_1.id}"
    expect(page).to have_content(hospital_1.name)
  end

  it "lists all the patients the doctor has" do
    visit "/doctors/#{doc_1.id}"
    expect(page).to have_content(patient_1.name)
    expect(page).to have_content(patient_2.name)
    expect(page).to have_content(patient_3.name)
    expect(page).not_to have_content(patient_4.name)
  end

  xit "has a remove patients button" do
    visit "/doctors/#{doc_2.id}"
    expect(page).to have_content(patient_4.name)
    click_on "Remove #{patient_4.name}"
    expect(page).not_to have_content(patient_4.name)
  end
end
