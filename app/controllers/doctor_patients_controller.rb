class DoctorPatientsController < ApplicationController
  def destroy
    require "pry"; binding.pry
    DoctorPatient.find(params[:id]).destroy

    # @doctor = Doctor.find(params[:id])
    # @patient = Patient.find(params[:id])
    # @doctor_patient = DoctorPatient.find_by(doctor_id: @doctor.id, patient_id: @patient.id)
    # @doctor_patient.destroy

    redirect_to doctor_path(@doctor)
  end
end