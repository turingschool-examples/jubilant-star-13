class PatientsController < ApplicationController
  def index
    @pats = Patient.all
  end
end