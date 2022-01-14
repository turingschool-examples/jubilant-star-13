class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(hospital_params[:id])
  end

  private

  def hospital_params
    params.permit(:id, :name)
  end

end
