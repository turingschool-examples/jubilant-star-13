class DoctorPatientsController < ApplicationController
  def destroy
    patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    
    patient.destroy
    redirect_to "doctors/#{params[:doctor_id]}"
  end
end
