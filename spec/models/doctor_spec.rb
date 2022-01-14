require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @hospital_2 = Hospital.create!(name: "St. Mary's")
      @doctor_1 = @hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    end

    describe '#employer' do
      it 'gives name of hospital where doctor works' do
        expect(@doctor_1.employer).to eq(@hospital_1.name)
      end
    end
  end
end
