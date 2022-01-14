Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/doctors/:id', to: 'doctors#show'
  patch '/doctors/:id/:patient_id', to: 'doctors#update'

  get '/hospitals/:id', to: 'hospitals#show'


end
