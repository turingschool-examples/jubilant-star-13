require 'factory_bot_rails'

Hospital.destroy_all
Doctor.destroy_all
Patient.destroy_all
DoctorPatient.destroy_all

hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

doctor_1 = FactoryBot.create(:doctor, name: "Bob B", hospital: hospital, university: "Yale")
doctor_2 = FactoryBot.create(:doctor, name: "Amy A", hospital: hospital, university: "Yale")
doctor_3 = FactoryBot.create(:doctor, name: "Charlie C", hospital: hospital, university: "Harvard")
doctor_4 = FactoryBot.create(:doctor, name: "Dolly D", hospital: hospital, university: "Princeton")

patient_1 = FactoryBot.create(:patient_with_doctor, doctor: doctor_1)
patient_2 = FactoryBot.create(:patient_with_doctor, doctor: doctor_1)
patient_3 = FactoryBot.create(:patient_with_doctor, doctor: doctor_1)
patient_4 = FactoryBot.create(:patient_with_doctor, doctor: doctor_1)

patient_5 = FactoryBot.create(:patient_with_doctor, doctor: bailey)
patient_6 = FactoryBot.create(:patient_with_doctor, doctor: bailey)
patient_7 = FactoryBot.create(:patient_with_doctor, doctor: bailey)
patient_8 = FactoryBot.create(:patient_with_doctor, doctor: bailey)
