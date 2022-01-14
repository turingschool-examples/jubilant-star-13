require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe '#unique_staff_schools' do
    let!(:grace) {Hospital.create!(name: "Seattle Grace Memorial Hospital")}

    let!(:bailey) {Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: grace)}
    let!(:merideth) {Doctor.create!(name: "Merideth Grey", specialty: "General Surgery", university: "Boston University", hospital: grace)}
    let!(:dreamy) {Doctor.create!(name: "Doctor Dreamy", specialty: "Neuroscience", university: "Boston University", hospital: grace)}
    it 'collects a unique list of schools that staff attended' do
      expect(grace.unique_staff_schools).to eq(["Boston University", "Stanford University"])
    end
  end
end
