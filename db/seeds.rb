Hospital.destroy_all
Doctor.destroy_all

@hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
@bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
@drew = Patient.create!(name: "Drew Jones", age: 30)
@anne = Patient.create!(name: "Anne Brady", age: 50)

@patient_doctor = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @drew.id)
@patient_doctor = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @anne.id)
