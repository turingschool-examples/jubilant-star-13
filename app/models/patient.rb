class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.ordered
    self.order(age: :desc)
  end
end
