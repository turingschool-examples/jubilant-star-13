require 'rails_helper'

# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

RSpec.describe 'Doctors show page' do
  before do
    @hosp_1 = Hospital.create!(name: 'mercy')
    @hosp_2 = Hospital.create!(name: 'grace')
    @hosp_3 = Hospital.create!(name: 'healing')

    @doc_1 = @hosp_1.doctors.create!(name: 'Doctor one', specialty: 'Brains', university: 'first state')
    @doc_2 = @hosp_2.doctors.create!(name: 'Doctor two', specialty: 'Hands', university: 'second state')
    @doc_3 = @hosp_3.doctors.create!(name: 'Doctor three', specialty: 'Backs', university: 'third state')

    # @patient_1 = @doc_1.patients.create!(name: "ima", age: 22)
    # @patient_2 = @doc_2.patients.create!(name: "ura", age: 35)
    # @patient_4 = @doc_3.patients.create!(name: "itta", age: 29)
    # @patient_5 = @doc_3.patients.create!(name: "somebody", age: 45)
    # @patient_6 = @doc_3.patients.create!(name: "nobody", age: 51)

    visit "/doctors/#{@doc_3.id}"
  end

  it 'I see all of that doctors attribute information' do
    expect(page).to have_content(@doc_3.name)
    expect(page).to have_content(@doc_3.specialty)
    expect(page).to have_content(@doc_3.university)
    expect(page).to_not have_content(@doc_1.name)
    expect(page).to_not have_content(@doc_1.specialty)
    expect(page).to_not have_content(@doc_1.university)
  end
end