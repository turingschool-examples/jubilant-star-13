require 'rails_helper'

RSpec.describe 'patients index page' do
  it 'lists all the patients from oldest to youngest' do
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

    visit patients_path

    within '.patients' do
      first_patient = find(".patient-#{patient_4.id}")
      second_patient = find(".patient-#{patient_2.id}")
      third_patient = find(".patient-#{patient_3.id}")
      fourth_patient = find(".patient-#{patient_1.id}")

      expect(first_patient).to appear_before(second_patient)
      expect(second_patient).to appear_before(third_patient)
      expect(third_patient).to appear_before(fourth_patient)
      expect(fourth_patient).to_not appear_before(first_patient)
    end
  end
end
