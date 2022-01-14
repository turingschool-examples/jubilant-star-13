require 'rails_helper'

RSpec.describe "hospital show page" do 
  let!(:three_sisters) { Hospital.create!(name: "Three Sisters Hospital") }
  let!(:samantha) { three_sisters.doctors.create!(name: "Samanta O'Brian", specialty: "Cardiologist", university: "USC") }
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

      expect(page).to have_content(samantha.name)
      expect(page).to have_content(samantha.specialty)
      expect(page).to have_content(samantha.university)
      expect(page).to_not have_content(gary.name)
    end 

    scenario 'visitor sees name of hospital doctor works for' do 
      expect(page).to have_content(three_sisters.name)
      expect(page).to_not have_content(two_brothers.name)
    end 

    scenario 'visitor sees name of patients doctor has' do 
      expect(page).to have_content(jackie.name)
      expect(page).to have_content(lionel.name)
      expect(page).to have_content(sarah.name)

      expect(page).to_not have_content(rod.name)
    end 
  end 
end 