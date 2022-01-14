require 'rails_helper'

describe 'doctor show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
  end
  it 'displays name, specialty, and university' do
    visit doctor_path(@bailey)

    expect(page).to have_content(@bailey.name)
    expect(page).to have_content(@bailey.specialty)
    expect(page).to have_content(@bailey.university)
  end
end
