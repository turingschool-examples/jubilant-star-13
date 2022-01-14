Hospital.destroy_all
Doctor.destroy_all
Patient.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
patient_1 = Patient.create!(name: "George O'Malley", age: 35)
patient_2 = Patient.create!(name: "Mark Zuckerburg", age: 45)
patient_3 = Patient.create!(name: "Jeremy Johnson", age: 23)
patient_4 = Patient.create!(name: "Miranda Lambert", age: 40)

bailey.patients << patient_1
bailey.patients << patient_2
bailey.patients << patient_3
