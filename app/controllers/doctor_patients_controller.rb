class DoctorPatientsController < ApplicationController

  def destroy
    @doctor_patient = DoctorPatient.destroy(params[:id])

    redirect_to doctor_path(params[:doctor_id])
  end
end
