class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    @doctor_patient = DoctorPatient.find_by(doctor_id: @doctor.id, patient_id: patient_params)
  end

    private

      def patient_params
        params.p
end