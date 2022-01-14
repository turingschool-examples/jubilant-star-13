require "rails_helper"

describe 'doctor show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name:"Other hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @meredith = @hospital.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Washington University")
    @patient1 = Patient.create!(name:"Kelly", age: 25)
    @patient2 = Patient.create!(name:"Kara", age: 23)
    @patient3 = Patient.create!(name:"Josh", age: 29)
    @patient4 = Patient.create!(name:"Jana", age: 21)
    @patient_doc1 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @bailey.id)
    @patient_doc2 = PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @bailey.id)
    @patient_doc1 = PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @bailey.id)
    @patient_doc3 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @meredith.id)
    @patient_doc1 = PatientDoctor.create!(patient_id: @patient4.id, doctor_id: @meredith.id)
    visit "/doctors/#{@bailey.id}"
  end

  it 'I see all of that doctors information' do
    expect(page).to have_content(@bailey.name)
    expect(page).to have_content(@bailey.specialty)
    expect(page).to have_content(@bailey.university)
    expect(page).to_not have_content(@meredith.name)
  end

  it 'I see the name of the hospital where this doctor works' do
    expect(page).to have_content("Works at: #{@hospital.name}")
    expect(page).to_not have_content(@hospital2.name)
  end

  it 'I see the names of all of the patients this doctor has' do
    expect(page).to have_content("Patients: #{@patient1.name} #{@patient2.name} #{@patient3.name}")
    expect(page).to_not have_content(@patient4.name)
  end

  it 'Next to each patients name, I see a button to remove that patient from that doctors caseload' do
    click_button("Remove #{@patient1.name}")
    expect(current_path).to eq("/doctors/#{@bailey.id}")
    expect(page).to_not have_content(@patient1.name)
  end
end
