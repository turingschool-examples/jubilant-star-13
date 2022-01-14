Rails.application.routes.draw do
  resources :doctors, only: :show
  delete '/doctor_patients/delete', to: 'doctor_patients#destroy'
  resources :hospitals, only: :show
end
