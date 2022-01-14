Hospital.destroy_all
Doctor.destroy_all

@hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
@hospital_2 = Hospital.create!(name: 'Childrens Hospital')

@doctor_1 = Doctor.create!(name: 'Doctor Strange', specialty: 'General Surgery', university: 'Stanford university', hospital_id: @hospital_1.id)
@doctor_2 = Doctor.create!(name: 'Doctor Jenner', specialty: 'Brain Surgery', university: 'Harvard university', hospital_id: @hospital_1.id)
@doctor_3 = Doctor.create!(name: 'Doctor Hash', specialty: 'Doctor Stuff', university: 'Some university', hospital_id: @hospital_1.id)
@doctor_3 = Doctor.create!(name: 'Doctor Integer', specialty: 'Counting', university: 'Some university', hospital_id: @hospital_1.id)
@doctor_4 = Doctor.create!(name: 'Doctor String', specialty: 'Orthopedics', university: 'Harvard university', hospital_id: @hospital_2.id)
