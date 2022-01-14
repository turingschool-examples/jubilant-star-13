class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    @count_of_doctors = @hospital.doctors.count
    @unique_list_uni = @hospital.doctors.distinct.pluck(:university)
  end
end
