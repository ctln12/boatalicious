Rails.application.routes.draw do
  devise_for :users
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'boats/:id', to: 'boats#show'
end
