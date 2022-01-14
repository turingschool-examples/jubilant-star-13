require 'rails_helper'

describe 'doctor show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

    @patient1 = Patient.create!(name: "Grace", age: 14)
    @patient2 = Patient.create!(name: "Ian", age: 47)

    @bailey_patient1 = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @patient1.id)
    @bailey_patient2 = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @patient2.id)
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

  it 'removes patient from doctor workload' do
    within "#doctors_patients" do
      within "#patient-#{@patient1.id}" do
        click_button "Remove This Patient"
      end
    end
    expect(current_path).to eq(doctor_path(@bailey))
    save_and_open_page
    expect(page).not_to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
  end

  # add more patients associated w different doctor
  # for more robust testing after complete other stories
end
