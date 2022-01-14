class DoctorPatientsController < ApplicationController

  def destroy
    doctor_id = DoctorPatient.find(doctor_patient_params[:id]).doctor_id
    if DoctorPatient.delete(doctor_patient_params[:id])
      redirect_to doctor_path(Doctor.find(doctor_id))
      flash[:notice] = "Patient Removed"
    else
      flash[:alert] = "Error: Patient Not Removed"
    end
  end


  private

  def doctor_patient_params
    params.permit(:id, :doctor_id, :patient_id)
  end

end
