class HospitalsController < ApplicationController
  def show
    @hosp = Hospital.find(params[:id])
  end
end