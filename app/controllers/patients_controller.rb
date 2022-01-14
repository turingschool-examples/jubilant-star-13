class PatientsController < ApplicationController
  # def show 
  #   @hospital = Hospital.find(params[:id])
  #   @doctors = @hospital.doctors 
  # end

  def destroy
    hospital = Hospital.find(params[:hospital_id])
    doctor = Doctor.find(params[:doctor_id])
    patient = doctor.doctor_patients.where(id: params[:patient_id]).first

    patient.destroy

    redirect_to hospital_doctor_path(hospital, doctor)
  end
end 
    # @doctor = Doctor.find(params[:id])
    # 
    # @patients = @doctor.patients