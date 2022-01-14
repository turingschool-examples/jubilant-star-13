require 'rails_helper'

RSpec.describe "Patient Index Page" do
  before(:each) do
    @patient_1 = Patient.create!(name: "George O'Malley", age: 35)
    @patient_2 = Patient.create!(name: "Mark Zuckerburg", age: 45)
    @patient_3 = Patient.create!(name: "Jeremy Johnson", age: 23)
    @patient_4 = Patient.create!(name: "Miranda Lambert", age: 40)

    visit patients_path
  end

  scenario "visitor sees the names of all patients listed from oldest to youngest" do
    expect(@patient_2.name).to appear_before(@patient_4.name)
    expect(@patient_4.name).to appear_before(@patient_1.name)
    expect(@patient_1.name).to appear_before(@patient_3.name)
  end
end
