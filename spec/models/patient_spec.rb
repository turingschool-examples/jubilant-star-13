require 'rails_helper'

RSpec.describe Patient do
  before do
    @patient1 = Patient.create!(name:"Kelly", age: 25)
    @patient2 = Patient.create!(name:"Kara", age: 23)
    @patient3 = Patient.create!(name:"Josh", age: 29)
    @patient4 = Patient.create!(name:"Jana", age: 21)
  end
  describe 'relationships' do
    it { should have_many(:patient_doctors) }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  it '#age_order' do
    expect(Patient.age_order).to eq([@patient3, @patient1, @patient2, @patient4])
  end
end
