class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient_deleted = DoctorPatient.where({doctor: params[:doctor_id], patient: params[:patient_id]})
    doctor_patient_deleted.destroy_all
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
