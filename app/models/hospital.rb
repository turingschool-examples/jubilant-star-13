class Hospital < ApplicationRecord
  has_many :doctors

  def universities
    doctors
    .group(:university)
    .pluck(:university)
  end
end
