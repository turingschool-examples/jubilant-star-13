require 'rails_helper'

RSpec.describe 'doctor show page' do
  let!(:grace) {Hospital.create!(name: "Seattle Grace Memorial Hospital")}

  let!(:bailey) {Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: grace)}
  let!(:merideth) {Doctor.create!(name: "Merideth Grey", specialty: "General Surgery", university: "Stanford University", hospital: grace)}

  let(:denny) {Patient.create!(name: "Denny Duquette", age: 39, doctor: bailey)}
  let(:bob) {Patient.create!(name: "Bob Duquette", age: 44, doctor: bailey)}
  let(:larry) {Patient.create!(name: "Larry Duquette", age: 27, doctor: bailey)}

  let(:jeff) {Patient.create!(name: "Jeff Individual", age: 39, doctor: merideth)}
  let(:george) {Patient.create!(name: "George Individual", age: 44, doctor: merideth)}
  let(:hal) {Patient.create!(name: "hal Individual", age: 27, doctor: merideth)}

  it 'displays the doctors information' do
  end

  it 'displays the name of the hospital the doctor works at' do
  end

  it 'displays the names of all the patients the doctor has' do
  end
end
