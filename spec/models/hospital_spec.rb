require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: "Rose Medical Center")
      @hospital_2 = Hospital.create!(name: "Swedish Medical Center")

      @doctor_1 = @hospital_1.doctors.create!(name: "Dr 1", specialty: "Specialty 1", university: "University 1" )
      @doctor_2 = @hospital_1.doctors.create!(name: "Dr 2", specialty: "Specialty 2", university: "University 1" )
      @doctor_3 = @hospital_1.doctors.create!(name: "Dr 3", specialty: "Specialty 3", university: "University 2" )
      @doctor_4 = @hospital_1.doctors.create!(name: "Dr 4", specialty: "Specialty 4", university: "University 2" )
      @doctor_5 = @hospital_1.doctors.create!(name: "Dr 5", specialty: "Specialty 5", university: "University 3" )

      @doctor_6 = @hospital_2.doctors.create!(name: "Dr 6", specialty: "Specialty 6", university: "University 4" )
      @doctor_7 = @hospital_2.doctors.create!(name: "Dr 7", specialty: "Specialty 7", university: "University 4" )
      @doctor_8 = @hospital_2.doctors.create!(name: "Dr 8", specialty: "Specialty 8", university: "University 5" )
      @doctor_9 = @hospital_2.doctors.create!(name: "Dr 9", specialty: "Specialty 9", university: "University 5" )
    end

    it 'counts the number of doctors at the hospital' do
      expect(@hospital_1.doctor_count).to eq(5)
      expect(@hospital_2.doctor_count).to eq(4)
    end

    it 'makes a list of unique universities attended by doctors of the hospital' do
      expect(@hospital_1.unique_universities).to eq(["University 1", "University 2", "University 3"])
      expect(@hospital_2.unique_universities).to eq(["University 4", "University 5"])
    end
  end
end
