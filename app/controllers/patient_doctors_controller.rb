class PatientDoctorsController < ApplicationController

  def destroy
    doc_id = doctor_patient_params[:id]
    pat_id = doctor_patient_params[:patient_id]

    PatientDoctor.where(doctor_id: doc_id, patient_id: pat_id).first.destroy

    redirect_to "/doctors/#{doc_id}"
  end


  private

  def doctor_patient_params
    params.permit(:id, :patient_id)
  end

end
