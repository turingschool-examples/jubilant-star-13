class PatientsController < ApplicationController 

  def index 
    @patients = Patient.all.by_age
  end
  
end
