class PatientsController < ApplicationController

  def index
    @patients = Patient.age_desc
  end


  private

  def patient_params
    params.permit(:id, :name, :age)
  end

end
