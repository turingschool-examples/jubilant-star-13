class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients 
  has_many :patients, through: :doctor_patients

  def self.unique_universities
    select(:university).pluck(:university)
  end
end
