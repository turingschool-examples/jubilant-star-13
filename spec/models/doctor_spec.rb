require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients)}

    let!(:three_sisters) { Hospital.create!(name: "Three Sisters Hospital") }
    let!(:samantha) { three_sisters.doctors.create!(name: "Samanta Mumba", specialty: "Cardiologist", university: "USC") }
    let!(:lisa) { three_sisters.doctors.create!(name: "Lisa Left Eye Lopez", specialty: "Neurosurgeon", university: "UT") }
    let!(:lauryn) { three_sisters.doctors.create!(name: "Lauryn Hill", specialty: "General", university: "Harvard") }
    
    describe 'class methods'
    it '.unique_universities' do 
      expect(three_sisters.doctors.unique_universities).to eq([samantha.university, lisa.university, lauryn.university])
    end 
  end
end
