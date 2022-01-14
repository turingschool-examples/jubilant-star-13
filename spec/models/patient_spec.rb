require 'rails_helper'

describe Patient do
  describe 'relationships' do
    it { should have_many :doctors }
  end
end