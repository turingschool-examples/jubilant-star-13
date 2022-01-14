require 'rails_helper'

describe 'doctors show page' do
  it "I see doctors attributes" do
    hospital1 = Hospital.create!(name: 'sacred heart')
    doc1 = hospital1.doctors.create!(name: 'wade', specialty: 'medicine', university: 'u of d')
    doc2 = hospital1.doctors.create!(name: 'brett', specialty: 'love', university: 'wilm u')
    visit doctor_path(doc1)
    expect(page).to have_content(doc1.name)
    expect(page).to have_content(doc1.specialty)
    expect(page).to have_content(doc1.university)

    expect(page).to_not have_content(doc2.name)
    expect(page).to_not have_content(doc2.specialty)
    expect(page).to_not have_content(doc2.university)

  end

  it "shows the name of hospital" do
    hospital1 = Hospital.create!(name: 'sacred heart')
    hospital2 = Hospital.create!(name: 'hells pass')
    doc1 = hospital1.doctors.create!(name: 'wade', specialty: 'medicine', university: 'u of d')
    doc2 = hospital2.doctors.create!(name: 'brett', specialty: 'love', university: 'wilm u')
    visit doctor_path(doc1)

    expect(page).to have_content(hospital1.name)
    expect(page).to_not have_content(hospital2.name)
  end
  it "shows patients that the doctor has" do
    hospital1 = Hospital.create!(name: 'sacred heart')
    hospital2 = Hospital.create!(name: 'hells pass')
    doc1 = hospital1.doctors.create!(name: 'wade', specialty: 'medicine', university: 'u of d')
    doc2 = hospital1.doctors.create!(name: 'brett', specialty: 'love', university: 'wilm u')
    patient1 = Patient.create!(name: 'katie', age: 28)
    patient2 = Patient.create!(name: 'gus', age: 2)
    DoctorPatient.create!(doctor: doc1, patient: patient1)
    DoctorPatient.create!(doctor: doc1, patient: patient2)
    visit doctor_path(doc1)

    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
  end

  it "removes patient from doctor work load" do
    hospital1 = Hospital.create!(name: 'sacred heart')
    hospital2 = Hospital.create!(name: 'hells pass')
    doc1 = hospital1.doctors.create!(name: 'wade', specialty: 'medicine', university: 'u of d')
    doc2 = hospital1.doctors.create!(name: 'brett', specialty: 'love', university: 'wilm u')
    patient1 = Patient.create!(name: 'katie', age: 28)
    patient2 = Patient.create!(name: 'gus', age: 2)
    patient3 = Patient.create!(name: 'tracy', age: 40)
    DoctorPatient.create!(doctor: doc1, patient: patient1)
    DoctorPatient.create!(doctor: doc1, patient: patient2)
    DoctorPatient.create!(doctor: doc1, patient: patient3)
    visit doctor_path(doc1)

    expect(page).to have_button("remove #{patient1.name}")
    expect(page).to have_button("remove #{patient2.name}")
    expect(page).to have_button("remove #{patient3.name}")

    click_button "remove #{patient1.name}"

    expect(page).to_not have_content(patient1.name)
    expect(page).to_not have_button("#{patient1.name}")

    expect(page).to have_content(patient2.name)
    expect(page).to have_content(patient3.name)

    click_button "remove #{patient2.name}"

    expect(page).to_not have_content(patient2.name)
    expect(page).to_not have_button("#{patient2.name}")

    expect(page).to have_content(patient3.name)

  end
end
