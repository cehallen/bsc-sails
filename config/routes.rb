Bscsails::Application.routes.draw do
  resources :sails
  root 'sails#index'
end
