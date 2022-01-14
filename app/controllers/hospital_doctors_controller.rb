class HospitalDoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:doctor_id])
    @hospital = Hospital.find(params[:hospital_id])
  end
end
