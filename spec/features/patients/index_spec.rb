require 'rails_helper'

RSpec.describe 'the patients show page' do

  before :each do
    @drew = Patient.create!(name: "Drew Jones", age: 30)
    @anne = Patient.create!(name: "Anne Brady", age: 50)
    @jordy = Patient.create!(name: "Brody Jordy", age: 15)
    @isthmus = Patient.create!(name: "Isthmus von Iris", age: 5)
  end

  it 'lists patients by age, old to young' do
    visit '/patients'

    expect(@anne.name).to appear_before(@drew.name)
    expect(@drew.name).to appear_before(@jordy.name)
    expect(@jordy.name).to appear_before(@isthmus.name)
  end

end
