class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])
    doctor_patient = DoctorPatient.where(doctor_id: doctor.id, patient_id: patient.id)
    doctor_patient.first.destroy
    redirect_to "/hospitals/#{doctor.hospital_id}/doctors/#{doctor.id}"
  end
end
