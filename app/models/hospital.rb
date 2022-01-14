class Hospital < ApplicationRecord
  has_many :doctors

  def uniq_uni
    doctors.distinct.pluck(:university)
  end
end
