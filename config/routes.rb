Bscsails::Application.routes.draw do
  resources :sailors
  resources :sails
  root to: 'sails#index'
end
