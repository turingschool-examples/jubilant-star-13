class Hospital < ApplicationRecord
  has_many :doctors

  def doc_count
    doctors.count
  end

  def unique_unis
    doctors.distinct(:university).pluck(:university)
  end
end
