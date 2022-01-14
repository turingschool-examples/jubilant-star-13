class Hospital < ApplicationRecord
  has_many :doctors

  def uniq_universities
    doctors.pluck(:university).uniq
  end
end
