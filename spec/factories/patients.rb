FactoryBot.define do
  factory :patient do
    name { "Default Patient Name" }
    age { 17 }

    factory :patient_with_doctor do

      transient do
        doctor {create(:doctor)}
      end

      after(:create) do |patient, evaluator|
        doctor_patient = create(:doctor_patient, doctor: evaluator.doctor, patient: patient)
      end
    end
  end
end
