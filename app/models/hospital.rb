class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end 
  def assoc_universities
    doctors.select("doctors.university").distinct
  end
end
