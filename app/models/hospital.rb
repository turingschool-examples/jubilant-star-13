class Hospital < ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end
end
