class PatientsController < ApplicationController
  def destroy
    binding.pry
    patient = Patient.find(params[:id])
    @doctor = patient.doctors
    # patient_doctor = PatientDoctor.find(patient_id = patient.id)
    # must destroy patient_doctor first

    patient.destroy
    redirect_to(doctor_path(@doctor))
  end
end
