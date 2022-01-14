class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities
    Hospital.joins(:doctors).pluck(:university).uniq
  end
end
