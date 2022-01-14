class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @number_of_doctors = @hospital.doctors.count
    @unique_university = @hospital.doctors.select(:university).distinct
  end
end