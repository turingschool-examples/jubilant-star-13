class PatientsController < ApplicationController
  def index
    @patients = Patient.older_first
  end
end 
