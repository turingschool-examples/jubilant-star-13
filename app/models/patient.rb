class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.order_ages
     self.order(age: :desc)
  end
end
