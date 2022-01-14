class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  validates_presence_of :name 

  # Instance Methods
  def doctor_count
    doctors.count
  end
end
