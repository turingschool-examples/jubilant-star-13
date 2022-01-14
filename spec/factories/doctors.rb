FactoryBot.define do
  factory :doctor do
    sequence(:name) {|n|"Default Doctor Name #{n}"}
    specialty {"Default Speciality"}
    university {"Default University"}
    hospital
  end
end
