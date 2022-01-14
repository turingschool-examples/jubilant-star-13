Rails.application.routes.draw do

  resources :doctors, only:[:show, :update] do
    resources :patients, only:[:destroy]
  end
  resources :hospitals, only:[:show]
end
