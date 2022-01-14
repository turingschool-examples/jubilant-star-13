class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count(:id)
  end

  def doctor_educations
    doctors.select('doctors.university').distinct.pluck('doctors.university')
  end
end
