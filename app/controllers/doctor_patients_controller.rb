class DoctorPatientsController < ApplicationController
  def destroy
    patient_doctor = PatientDoctor.find_by(doctor_id: params[:doctor_id], patient_id: params[:id])
    patient_doctor.destroy
    redirect_to doctor_path(patient_doctor.doctor_id)
  end
end
