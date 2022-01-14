class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = @doctor.hospital
  end

  def update
    @doctor = Doctor.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @doctor.patients.select(@patient.id).remove_connection
    @doctor.update(doctor_params)
    redirect_to "/doctors/#{@doctor.id}"
  end

  private
    def doctor_params
      params.permit(:patients)
    end
end
