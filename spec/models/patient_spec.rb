require 'rails_helper'

RSpec.describe Patient do
  describe "relationships" do
    xit { should have_many(:doctors).through(:doctor_patients) }
  end
end