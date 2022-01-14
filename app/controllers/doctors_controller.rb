class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = Hospital.find(@doctor.hospital_id)
  end
end
