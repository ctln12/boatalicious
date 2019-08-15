Rails.application.routes.draw do
  get 'bookings/new', to: 'bookings#new'
  post 'bookings/', to: 'bookings#create'
  get 'bookings', to: 'bookings#index'
  devise_for :users
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'boats/new', to: 'boats#new'
  post 'boats/', to: 'boats#create'
  get 'boats/:id', to: 'boats#show', as: 'boat_show'
  get 'bookings' , to: 'bookings#index'
end
