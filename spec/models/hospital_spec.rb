require 'rails_helper'

RSpec.describe Hospital do

  let!(:hospital_1) { Hospital.create!(name: "Hospital 1")}

  let!(:doc_1) { Doctor.create!(name: "Doc 1", specialty: "special 1", university: "University 1", hospital_id: hospital_1.id)}
  let!(:doc_2) { Doctor.create!(name: "Doc 2", specialty: "special 2", university: "University 2", hospital_id: hospital_1.id)}
  let!(:doc_3) { Doctor.create!(name: "Doc 3", specialty: "special 3", university: "University 2", hospital_id: hospital_1.id)}
  let!(:doc_4) { Doctor.create!(name: "Doc 4", specialty: "special 4", university: "University 4", hospital_id: hospital_1.id)}

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  it "returns a list of uniq univeristies" do
    expect(hospital_1.uniq_universities).to eq(["University 1", "University 2", "University 4"])
  end
end
