require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should have_many(:doctor_patients) }
  it { should have_many(:doctors).through(:doctor_patients) }
  it { should have_many(:hospitals).through(:doctors) }

  describe 'class methods' do
    describe '.age_desc' do
      it "returns all patients in descending order by age" do
        bob = create(:patient, name:'Bob', age: 105)
        terry = create(:patient, name:'Terry', age: 6)
        bill = create(:patient, name:'Bill', age: 15)

        expect(Patient.age_desc.count).to eq(3)
        expect(Patient.age_desc).to eq([bob, bill, terry])
      end
    end
  end
end
