class Patient < ApplicationRecord
  has_many :doctors
  has_many :doctors, through: :doctor_patients
end