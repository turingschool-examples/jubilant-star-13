class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def doctor_count
    doctors.count
  end

  def doctor_universities
    doctors.pluck(:university).uniq.join(', ')
  end
end
