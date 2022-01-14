class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    # require "pry!"; binding.pry
    hospital = Hospital.find_by(id: params[:hospital_id])
    doctor = Doctor.find(params[:id])
    patient = Patient.find(params[:id])
    doctor.patients.delete(patient)
    redirect_to hospital_doctor_path(hospital, doctor)
  end
end
