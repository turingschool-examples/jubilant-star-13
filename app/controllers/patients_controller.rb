class PatientsController < ApplicationController

  def index
    @patients = Patient.all.ordered_patients
  end


end
