Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hospitals/:hospital_id/doctors/:doctor_id', to: 'hospital_doctors#show'

  get '/hospitals/:hospital_id', to: 'hospitals#show'

  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'
end
