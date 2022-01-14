require 'rails_helper'

RSpec.describe 'doctor show page' do
  let!(:grace) {Hospital.create!(name: "Seattle Grace Memorial Hospital")}

  let!(:bailey) {Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: grace)}
  let!(:merideth) {Doctor.create!(name: "Merideth Grey", specialty: "General Surgery", university: "Boston University", hospital: grace)}

  let(:denny) {Patient.create!(name: "Denny Duquette", age: 39, doctor: bailey)}
  let(:bob) {Patient.create!(name: "Bob Duquette", age: 44, doctor: bailey)}
  let(:larry) {Patient.create!(name: "Larry Duquette", age: 27, doctor: bailey)}

  let(:jeff) {Patient.create!(name: "Jeff Individual", age: 39, doctor: merideth)}
  let(:george) {Patient.create!(name: "George Individual", age: 44, doctor: merideth)}
  let(:hal) {Patient.create!(name: "Hal Individual", age: 27, doctor: merideth)}

  it 'displays the doctors information' do
    visit "/doctors/#{bailey.id}"

    expect(page).to have_content("Miranda Bailey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("Doctorate Recieved From: Stanford University")

    visit "/doctors/#{merideth.id}"

    expect(page).to have_content("Merideth Grey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("Doctorate Recieved From: Boston University")
  end

  it 'displays the name of the hospital the doctor works at' do

    visit "/doctors/#{bailey.id}"

    expect(page).to have_content("Practices at: Seattle Grace Memorial Hospital")

    visit "/doctors/#{merideth.id}"

    expect(page).to have_content("Practices at: Seattle Grace Memorial Hospital")
  end

  it 'displays the names of all the patients the doctor has' do

    visit "/doctors/#{bailey.id}"

    expect(page).to have_content("Patients")
    expect(page).to have_content("Denny Duquette")
    expect(page).to have_content("Bob Duquette")
    expect(page).to have_content("Larry Duquette")

    visit "/doctors/#{merideth.id}"

    expect(page).to have_content("Patients")
    expect(page).to have_content("Jeff Individual")
    expect(page).to have_content("George Individual")
    expect(page).to have_content("Hal Individual")
  end
end
