class Hospital < ApplicationRecord
  has_many :doctors

  def dr_count
    doctors.count
  end

  def unique_uni
    doctors.distinct.pluck(:university)
  end
end
