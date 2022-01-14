require 'rails_helper'

describe 'doctor show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @not_bailey = @hospital.doctors.create!(name: "not Bailey", specialty: "nun", university: "oooooooooooo")

    @patient1 = Patient.create!(name: "Grace", age: 14)
    @patient2 = Patient.create!(name: "Ian", age: 47)

    @not_baileys_patient1 = Patient.create!(name: "null", age: 0)
    @not_baileys_patient2 = Patient.create!(name: "null", age: 5)

    @bailey_patient1 = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @patient1.id)
    @bailey_patient2 = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @patient2.id)

    @not_bailey_patient1 = PatientDoctor.create!(doctor_id: @not_bailey.id, patient_id: @not_baileys_patient1.id)
    @not_bailey_patient2 = PatientDoctor.create!(doctor_id: @not_bailey.id, patient_id: @not_baileys_patient2.id)

    visit doctor_path(@bailey)
  end
  it 'displays name, specialty, and university' do
    expect(page).to have_content(@bailey.name)
    expect(page).to have_content(@bailey.specialty)
    expect(page).to have_content(@bailey.university)
  end

  it 'shows hospital doctor works at and all patients they care for' do
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
  end

  it 'does not show patients who are cared for by different doctors' do
    expect(page).not_to have_content(@not_baileys_patient1.name)
    expect(page).not_to have_content(@not_baileys_patient2.name)
  end

  it 'has button to remove patient' do
    within "#doctors_patients" do
      within "#patient-#{@patient1.id}" do
        expect(page).to have_button("Remove This Patient")
      end
    end
  end
end
