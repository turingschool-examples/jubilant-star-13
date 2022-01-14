class  PatientDoctorsController < ApplicationController
  def destroy

    current_patient = PatientDoctor.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])

    current_patient.destroy

    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end
