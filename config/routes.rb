Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants, only: [:index, :create] do
    resources :bookings, only: [:index, :create]
  end
end
