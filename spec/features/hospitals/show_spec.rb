require 'rails_helper'

RSpec.describe "hospital show page" do 
  let!(:three_sisters) { Hospital.create!(name: "Three Sisters Hospital") }
  let!(:samantha) { three_sisters.doctors.create!(name: "Samanta Mumba", specialty: "Cardiologist", university: "USC") }
  let!(:lisa) { three_sisters.doctors.create!(name: "Lisa Left Eye Lopez", specialty: "Neurosurgeon", university: "UT") }
  let!(:lauryn) { three_sisters.doctors.create!(name: "Lauryn Hill", specialty: "General", university: "Harvard") }
  let!(:jackie) { samantha.patients.create!(name: "Jackie Williams", age: 42)}
  let!(:lionel) { samantha.patients.create!(name: "Lionel Jackson", age: 51)}
  let!(:sarah) { samantha.patients.create!(name: "Sarah OJ", age: 32)}

  let!(:two_brothers) { Hospital.create!(name: "Two Brothers Hospital") }
  let!(:gary) {two_brothers.doctors.create!(name: "Gary", specialty: "Neurosurgeon", university: "Yale")}
  let!(:rod) { gary.patients.create!(name: "Rod Reimer", age: 22)}

  before :each do 
    visit hospital_path(three_sisters.id)
  end 
  describe 'when i visit the hospital show page' do 
    scenario 'visitor sees hospital name' do 
      expect(current_path).to eq(hospital_path(three_sisters.id))

      expect(page).to have_content(three_sisters.name)
      expect(page).to_not have_content(two_brothers.name)
    end 

    scenario 'visitor sees number of doctors that work in this hospital' do 
      expect(page).to have_content(three_sisters.doctors.count)
    end 

    scenario 'visitor sees a unique list of universities that this hospitals doctors attended' do 

      expect(page).to have_content("The doctors here graduated from: #{three_sisters.doctors.unique_universities}")
    end 
  end 
end 