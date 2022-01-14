require 'rails_helper'

describe 'patient deleted' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

    @patient1 = Patient.create!(name: "Grace", age: 14)
    @patient2 = Patient.create!(name: "Ian", age: 47)

    @bailey_patient1 = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @patient1.id)
    @bailey_patient2 = PatientDoctor.create!(doctor_id: @bailey.id, patient_id: @patient2.id)
    visit doctor_path(@bailey)
  end
  it 'removes patient from doctor when button is clicked' do
    within "#doctors_patients" do
      within "#patient-#{@patient1.id}" do
        click_button("Remove This Patient")
        save_and_open_page
      end
    end
    expect(current_path).to eq(doctor_path(@bailey))
    expect(page).not_to have_content(@patient1.name)
  end
end
