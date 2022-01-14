class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def doctor_university_list
    doctors.pluck(:university)
  end
end
