class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    Doctor.group(:hospital_id).count.values.last
    #come back and fix this one
  end

  def unique_school
    doctors.distinct.pluck(:university)
  end
end
