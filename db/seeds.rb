Hospital.destroy_all
Doctor.destroy_all
# Patient.destroy_all

# hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
# bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

@hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
@doctor = @hospital.doctors.create!(name: 'Joe Schmoe', specialty: 'General Surgery', university: "Stanford University")

@patient_1 = Patient.create!(name: 'Jane Schmoe', age: 28)
@patient_2 = Patient.create!(name: 'Moe Howard', age: 48)
@patient_3 = Patient.create!(name: 'James Smith', age: 48)

@doctor.patients << @patient_1
@doctor.patients << @patient_2
