Rails.application.routes.draw do
  root "pages#home"
  resources :libraries
  resources :books
  get 'signup', to:'users#new'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users , except: [:new]
  resources :genres , except: [:destroy]
  #root "libraries#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
