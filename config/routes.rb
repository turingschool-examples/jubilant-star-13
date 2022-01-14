Rails.application.routes.draw do

  resources :hospitals do 
    resources :doctors do 
      resources :patients 
    end 
  end 
end
