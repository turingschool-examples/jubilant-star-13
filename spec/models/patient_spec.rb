require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should have_many :patient_doctors }
  it { should have_many(:doctors).through(:patient_doctors) }

  describe '::order_by_age' do
    it 'returns the patients from oldest to youngest' do
      hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      hospital_2 = Hospital.create!(name: 'Hospital_2')
      doctor = hospital.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery',
                                        university: 'Stanford University')
      doctor_2 = hospital_2.doctors.create!(name: 'Doctor_2', specialty: 'General Surgery',
                                            university: 'Stanford University')
      patient_1 = doctor.patients.create!(name: 'patty', age: 22)
      patient_2 = doctor.patients.create!(name: 'john', age: 35)
      patient_3 = doctor.patients.create!(name: 'sally', age: 33)
      patient_4 = doctor_2.patients.create!(name: 'Billy', age: 44)

      actual = Patient.order_by_age
      expected = [patient_4, patient_2, patient_3, patient_1]
      expect(actual).to eq(expected)
    end
  end
end
