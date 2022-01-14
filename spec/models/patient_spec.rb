require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:patient_doctors) }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  before :each do
    @drew = Patient.create!(name: "Drew Jones", age: 30)
    @anne = Patient.create!(name: "Anne Brady", age: 50)
    @jordy = Patient.create!(name: "Brody Jordy", age: 15)
    @isthmus = Patient.create!(name: "Isthmus von Iris", age: 5)
  end

  describe 'class methods' do
    it '::old_to_young' do
      expect(Patient.old_to_young).to eq([@anne, @drew, @jordy, @isthmus])
    end

  end
end
