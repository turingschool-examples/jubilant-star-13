class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.order_names_by_age_desc 
    order(age: :desc).pluck(:name)
  end
end
