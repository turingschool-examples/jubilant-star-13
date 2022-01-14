class PatientsController < ApplicationController 

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    
    doctor.doctor_patients.where(doctor: doctor.id, patient: patient.id).destroy_all
    
    redirect_to "/doctors/#{doctor.id}"
  end

end
