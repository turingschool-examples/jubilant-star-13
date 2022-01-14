class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.order_by_age
    order(age: :desc)
  end
end
