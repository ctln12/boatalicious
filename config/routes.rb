Rails.application.routes.draw do
  get 'bookings/new', to: 'bookings#new'
  post 'bookings/', to: 'bookings#create'
  get 'bookings', to: 'bookings#index'
  devise_for :users
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'boats/:id', to: 'boats#show'
end
