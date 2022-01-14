class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def find_doctor_patient_record_id(doctor_id)
    record = doctor_patients.find_by(doctor_id: doctor_id )

    record.id
  end

  def self.order_youngest_to_oldest
    order(:age)
  end
end
