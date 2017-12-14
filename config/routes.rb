Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/callbacks' }
   
  resources :employees, only: [:index, :show]
  end
