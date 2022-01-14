class Hospital < ApplicationRecord
  has_many :doctors

  def universities
    doctors.pluck(:university).uniq
  end
end
