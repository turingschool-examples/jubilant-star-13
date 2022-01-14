require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  it { should belong_to(:doctor) }
  it { should belong_to(:patient) }
  it { should have_many(:hospitals).through(:doctor) }
end
