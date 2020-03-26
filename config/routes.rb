Rails.application.routes.draw do
  resources :libraries
  resources :books
  get 'signup', to:'users#new'
  resources :users , except: [:new]
  #root "libraries#index"
  root "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
