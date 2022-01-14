class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities
    doctors.pluck(:university).uniq
  end
end
