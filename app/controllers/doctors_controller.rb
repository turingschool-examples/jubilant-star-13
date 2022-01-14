class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    doctor = Doctor.find(params[:id])
    doctor.patients.delete(params[:patient_id])
    redirect_to doctor_path(doctor.id)
  end
end
