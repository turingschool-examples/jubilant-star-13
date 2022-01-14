Hospital.destroy_all
Doctor.destroy_all
Patient.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
miranda = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
denny = miranda.patients.create!({name: "Denny Duquette", age: 39})
elvis = miranda.patients.create!({name: "Elvis Presley", age: 49})
mandy = miranda.patients.create!({name: "Mandy Moore", age: 49})
