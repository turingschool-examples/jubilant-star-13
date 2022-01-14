require 'rails_helper'

describe 'doctor show' do
  before do
    @hospital_of_doctor = Hospital.create(name: "Hell's Pass")
    @our_doctor = Doctor.create(name: "Jekyll", specialty: "Hyding", university: "Londontown", hospital_id: @hospital_of_doctor.id)
    @not_our_doctor = Doctor.create(name: "Doogie", specialty: "Acting", university: "Hollywood", hospital_id: @hospital_of_doctor.id)
    @our_patient1 = Patient.create(name: "Harry", age: 35)
    @our_patient2 = Patient.create(name: "Sally", age: 33)
    @not_our_patient = Patient.create(name: "Chuck", age: 31)
    @doctor_patient1 = DoctorPatient.create(doctor_id: @our_doctor.id, patient_id: @our_patient1.id)
    @doctor_patient2 = DoctorPatient.create(doctor_id: @our_doctor.id, patient_id: @our_patient2.id)
    @doctor_patient3 = DoctorPatient.create(doctor_id: @not_our_doctor.id, patient_id: @not_our_patient.id)

    visit doctor_path(@our_doctor)
  end

  describe 'display' do
    it 'info' do
      expect(page).to have_content(@our_doctor.name)
      expect(page).to have_content(@our_doctor.specialty)
      expect(page).to have_content(@our_doctor.education)
      expect(page).to_not have_content(@not_our_doctor)
    end

    it 'hospital this doctor belongs to' do
      expect(page).to have_content(@doctor.hospital.name)
    end

    it 'names of this doctors patients' do
      expect(page).to have_content(@our_patient1.name)
      expect(page).to have_content(@our_patient2.name)
      expect(page).to have_content(@not_our_patient.name)
    end
  end
end