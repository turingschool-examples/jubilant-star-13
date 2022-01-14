require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  it { should have_a(:doctor) }
  it { should have_a(:patient) }
  it { should have_a(:hospital).through(:doctor) }
end
