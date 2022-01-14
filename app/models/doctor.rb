class Doctor < ApplicationRecord
  belongs_to :hospital

  has_many :doctor_patients
  has_many :patients, through: :doctor_patients


  def self.university_list
    distinct.pluck(:university)
  end
end
