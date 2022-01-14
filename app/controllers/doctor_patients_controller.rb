class DoctorPatientsController < ApplicationController

  def destroy
    
    doctor = Doctor.find(params[:doctor_id])
    doctor.patients.destroy(params[:patient_id])
    redirect_to "/doctors/#{params[:doctor_id]}"

  end

end
