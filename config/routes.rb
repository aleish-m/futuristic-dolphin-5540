Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post 'mechanics/:id', to: 'mechanics#create'

  get '/amusement_park/:id', to: 'amusement_park#show'
end
