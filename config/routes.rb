Rails.application.routes.draw do
  resources :doctors, only: :show
  resources :hospitals, only: :show
  delete '/doctors/:id/patients', to: 'patient_doctor#destroy'
end
