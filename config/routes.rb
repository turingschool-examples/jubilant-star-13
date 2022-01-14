Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show]

  delete '/doctors/:id/patients/:patient_id', to: 'doctor_patients#destroy'
  
  resources :hospitals, only: [:show]
  
  resources :patients, only: [:index]  
end
