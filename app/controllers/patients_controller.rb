class PatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    doctor = Doctor.find(params[:doctor_id])

    patient.destroy
    redirect_to(doctor_path(doctor))
  end
end
