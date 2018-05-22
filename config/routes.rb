Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  #get '/profile/:id', redirect: '/profile'
  get 'profile', to: 'profiles#show'
  #delete 'bands/destroy', to: 'bands#destroy'
  resources :profile, only: :show
  resources :bands do
    resources :bookings, only: :create
    resources :reviews, only: :create
  end

  resources :bookings, only: [:destroy, :update]
  resources :reviews, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
