Rails.application.routes.draw do
  resources :doctors, only: [:show] do
    
  end
end
