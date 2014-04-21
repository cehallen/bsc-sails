Bscsails::Application.routes.draw do
  devise_for :users
  resources :sails
  root 'sails#index'
end
