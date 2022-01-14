class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @patient = @doctor.patients.find(params[:patient_id])
    @doctor.patients.delete(@patient)
    redirect_to doctor_path(@doctor.id)
  end
end
