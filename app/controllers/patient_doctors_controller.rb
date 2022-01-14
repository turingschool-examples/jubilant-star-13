class PatientDoctorsController < ApplicationController

  def delete
    patient_doctor = PatientDoctor.where(patient_id: params[:patient_id], doctor_id: params[:doctor_id])
    PatientDoctor.destroy(patient_doctor.first.id)
    
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

end
