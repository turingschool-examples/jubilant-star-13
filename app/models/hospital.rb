class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities
    doctors.select(:university).distinct.pluck(:university)
  end
end
