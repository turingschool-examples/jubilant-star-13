class Hospital < ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def doctor_universities
    doctors
    .select(:university)
    .distinct
    .pluck(:university)
  end
end
