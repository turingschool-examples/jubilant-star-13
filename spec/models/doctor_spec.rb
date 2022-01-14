require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    xit { should belong_to(:hospital) }
    xit { should have_many(:patients).through(:doctor_patients) }
  end
end
