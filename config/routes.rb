Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show] do
    delete '/patients', to: 'doctor_patients#destroy'

  end

  resources :hospitals, only: [:show] do

  end

end
