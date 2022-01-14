class Hospital < ApplicationRecord
  has_many :doctors
  
  def doctor_count
    doctors.count
  end
  
  def unique_university_list 
    doctors.distinct(:university).pluck(:university)
  end
end
