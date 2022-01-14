Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, :hospitals, :patients
  delete '/doctorpatients', to: 'doctor_patients#destroy'

end
