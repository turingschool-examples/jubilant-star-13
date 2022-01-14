class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.older_first
    Patient.order(age: :desc)
  end
end
