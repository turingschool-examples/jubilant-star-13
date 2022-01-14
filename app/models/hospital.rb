class Hospital < ApplicationRecord
  has_many :doctors

  def hospital_doctor_universities
    doctors.university_list
  end
end
