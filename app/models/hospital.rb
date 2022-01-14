class Hospital < ApplicationRecord
  has_many :doctors

  def unique_staff_schools
    doctors.distinct.pluck(:university)
  end
end
