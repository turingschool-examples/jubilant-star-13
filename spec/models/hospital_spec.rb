require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  it "show unique list of doctos universities" do
    hosp1 = Hospital.create!(name: 'sacred heart')
    hosp2 = Hospital.create!(name: 'hells pass')
    doc1 = hosp1.doctors.create!(name: 'wade', specialty: 'medicine', university: 'u of d')
    doc2 = hosp1.doctors.create!(name: 'brett', specialty: 'love', university: 'wilm u')
    doc2 = hosp1.doctors.create!(name: 'mack', specialty: 'hate', university: 'u of d')

    expect(hosp1.uniq_uni).to eq(["u of d", "wilm u"])
  end
end
