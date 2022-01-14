Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors do 
    resources :doctor_patients
  end

  resources :patients, only: [:index]

  resources :hospitals
  
end
