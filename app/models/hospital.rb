class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  def doctor_count
    doctors.count
  end

  def universities
    doctors.group(:university).distinct.order(university: :asc).pluck(:university)
  end
end
