Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]

  delete '/doctors/:doctor_id/patients/:patient_id', to: 'patient_doctors#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
