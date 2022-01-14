require 'rails_helper'

RSpec.describe 'hospital show page' do
  let!(:hospital_1) { Hospital.create!(name: "Hospital 1")}
  let!(:hospital_2) { Hospital.create!(name: "Hospital 2")}

  it "checks we are on the right page" do

  end
end
