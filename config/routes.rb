Rails.application.routes.draw do
  root 'cars#index'
  get 'car/edit'
  resources :cars
end
