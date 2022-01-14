class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  # Class Methods
  def self.find_by_doc_pat(doctor, patient)
    find_by(doctor: doctor, patient: patient)
  end
end
