Hospital.destroy_all
Doctor.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

patient_1 = Patient.create!(name: "Billy Ray", age: 13)
patient_2 = Patient.create!(name: "Michael Smith", age: 25)

connect_1 = DoctorPatient.create!(doctor_id: bailey.id, patient_id: patient_1.id)
connect_2 = DoctorPatient.create!(doctor_id: bailey.id, patient_id: patient_2.id)
