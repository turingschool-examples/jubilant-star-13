Rails.application.routes.draw do

  resources :hospitals, only: [:show] do
  end
  
  resources :doctors, only: [:show] do
  end
end 

