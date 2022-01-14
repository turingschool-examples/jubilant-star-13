class PatientsController < ApplicationController
  def destroy
    doc = Doctor.find(params[:doctor_id])
    pat = Patient.find(params[:id])
    doc_pat = DoctorPatient.find_by(doctor: doc, patient: pat)
    doc_pat.destroy

    redirect_to hospital_doctor_path(doc.hospital, doc)
  end
end
