class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @doctor.patients.destroy
  end
end 