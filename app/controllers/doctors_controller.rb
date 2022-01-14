class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = @doctor.hospital
  end

  def update
    @doctor = Doctor.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @doctor_patient = DoctorPatient.find_by(doctor_id: @doctor.id, patient_id: @patient.id)
    @doctor_patient.destroy

    redirect_to "/doctors/#{@doctor.id}"
  end
end
