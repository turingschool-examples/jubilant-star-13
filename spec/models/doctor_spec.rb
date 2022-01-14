require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    describe '#hospital_name' do
      it "returns the name of the doctors hospital" do
        hospital = create(:hospital, name: 'Cool Hospital')
        doctor = create(:doctor, hospital: hospital)

        expect(doctor.hospital_name).to eq("Cool Hospital")
      end
    end
  end
end
