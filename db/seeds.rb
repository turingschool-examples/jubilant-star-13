Hospital.destroy_all
Doctor.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
patient1 = Patient.create!(name: 'katie', age: 28)
DoctorPatient.create!(doctor: doc1, patient: patient1)
