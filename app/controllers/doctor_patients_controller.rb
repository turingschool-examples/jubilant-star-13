class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find_by(patient_id: params[:id])
    doctor = Doctor.find_by(id: doctor_patient[:doctor_id])
    doctor_patient.destroy

    redirect_to "/doctors/#{doctor.id}"
  end
end
