class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.old_to_young
    Patient.order(age: :desc)
  end
end
