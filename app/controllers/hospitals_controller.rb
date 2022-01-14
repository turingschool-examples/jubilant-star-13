class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    @count_of_doctors = @hospital.doctors.count
    # require "pry"; binding.pry
  end
end
