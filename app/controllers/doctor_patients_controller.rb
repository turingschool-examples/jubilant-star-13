class DoctorPatientsController < ApplicationController
  def destroy
    doc = Doctor.find(params[:doctor_id])
    pat = Patient.find(params[:patient_id])
    # doc_patient= DoctorPatient.where('doctor_id =?', doc.id) and where patient_id = pat.idea
    # doc_patient = DoctorPatient.where(doctor_id: doc.id, patient_id: pat.id})
    doc_patient.destroy
    redirect_to "/doctors/#{doc.id}"
  end
end
