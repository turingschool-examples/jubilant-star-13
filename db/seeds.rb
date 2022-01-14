Doctor.destroy_all
Hospital.destroy_all

# hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
# bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

@hospital = Hospital.create(name: 'St. Jude')
@not_our_hospital = Hospital.create(name: 'Some random hospital')

@doctor1 = Doctor.create(name: 'Strange', specialty: 'Head/Shoulders', university: 'Marvel', hospital_id: @hospital.id)
@doctor2 = Doctor.create(name: 'Suess', specialty: 'Knees/Toes', university: 'RhymeTime', hospital_id: @hospital.id)
@doctor3 = Doctor.create(name: 'Octavis', specialty: 'Knees/Toes', university: 'Marvel', hospital_id: @hospital.id)
@not_our_doctor = Doctor.create(name: 'Phil', specialty: 'nothing', university: 'unknown', hospital_id: @not_our_hospital.id)