require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  it { should belong_to(:doctor) }
  it { should belong_to(:patient) }
  it { should have_many(:hospitals).through(:doctor) }

  describe "instance methods" do
    describe "#patient_name" do
      it "returns the patient name" do
        patient = create(:patient, name: 'Bob')
        doctor_patient = create(:doctor_patient, patient: patient)
        expect(doctor_patient.patient_name).to eq('Bob')
      end
    end
  end
end
