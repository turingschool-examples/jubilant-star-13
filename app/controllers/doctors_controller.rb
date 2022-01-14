class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = @doctor.hospital
  end

  def update
    @doctor = Doctor.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    remove_patient = @doctor.patients.select(@patient.id)
    require "pry"; binding.pry
  end
end
