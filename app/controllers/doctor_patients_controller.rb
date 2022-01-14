class DoctorPatientsController < ApplicationController

  def delete
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])
    doctor.patients.delete(patient)
    redirect_to "/doctors/#{doctor.id}"
  end
end
