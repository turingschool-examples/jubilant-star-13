class Hospital < ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def doctors_universities
    doctors.universities.sort
  end

end
