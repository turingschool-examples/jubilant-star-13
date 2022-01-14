class DoctorPatientsController < ApplicationController

  def destroy
    remove = DoctorPatient.where("patient_id = ? and doctor_id = ?", params[:remove_patient], params[:id])
    remove.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end
