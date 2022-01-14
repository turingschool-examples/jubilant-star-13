require "rails_helper"

describe 'hospital show page' do
  before do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name:"Other hospital")
    @bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @meredith = @hospital.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Washington University")
    @derek = @hospital.doctors.create!(name: "Derek Shepherd", specialty: "Neuro Surgery", university: "Washington University")
    @christina = @hospital2.doctors.create!(name: "Christina Yang", specialty: "Cardio Surgery", university: "Harvard University")
    visit "/hospitals/#{@hospital.id}"
  end

  it 'I see the hospitals name' do
    expect(page).to have_content(@hospital.name)
    expect(page).to_not have_content(@hospital2.name)
  end

  it 'I see the number of doctors that work at this hospital' do
    expect(page).to have_content("Number of doctors working here: 3")
  end

  it 'I see a unique list of universities that this hospitals doctors attended' do
    expect(page).to have_content("Universities attended: Stanford University Washington University")
    expect(page).to_not have_content("Universities attended: Stanford University Washington University Washington University")
    expect(page).to_not have_content(@christina.university)
  end
end
