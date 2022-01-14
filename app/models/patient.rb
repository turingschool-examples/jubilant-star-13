class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors


  def self.old_to_young
    all
    order(age: :desc)
  end
end
