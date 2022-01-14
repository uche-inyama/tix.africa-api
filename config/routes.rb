Rails.application.routes.draw do
  # get 'authentication/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events

  post '/authenticate', to: 'authentication#create'
end
