Hospital.destroy_all
Doctor.destroy_all
Patient.destroy_all
DoctorPatient.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

hosp_1 = Hospital.create!(name: 'hosp_1')
hosp_2 = Hospital.create!(name: 'hosp_2')

doc_1 = Doctor.create!(name: 'doc_1', specialty: 'spec_1', university: 'uni_1', hospital: hosp_1)
doc_2 = Doctor.create!(name: 'doc_2', specialty: 'spec_2', university: 'uni_2', hospital: hosp_2)
doc_3 = Doctor.create!(name: 'doc_3', specialty: 'spec_3', university: 'uni_3', hospital: hosp_1)
doc_4 = Doctor.create!(name: 'doc_4', specialty: 'spec_4', university: 'uni_1', hospital: hosp_1)

pat_1 = Patient.create!(name: 'pat_1', age: 1)
pat_2 = Patient.create!(name: 'pat_2', age: 2)
pat_3 = Patient.create!(name: 'pat_3', age: 3)
pat_4 = Patient.create!(name: 'pat_4', age: 4)

doc_pat_1 = DoctorPatient.create!(doctor: doc_1, patient: pat_1)
doc_pat_2 = DoctorPatient.create!(doctor: doc_1, patient: pat_2)
doc_pat_3 = DoctorPatient.create!(doctor: doc_2, patient: pat_4)
doc_pat_4 = DoctorPatient.create!(doctor: doc_1, patient: pat_3)