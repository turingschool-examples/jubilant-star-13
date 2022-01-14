class PatientDoctorController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:id])
    patient = doctor.patients.find_by(name: params[:name])
    patient_doctor = doctor.patient_doctors.find_by(patient_id: patient.id)
    patient_doctor.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end
