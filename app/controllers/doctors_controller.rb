class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = @doctor.hospital
  end

  def update
    @doctor = Doctor.find(params[:id])
    
  end
end
