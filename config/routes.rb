Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :user
   
  resources :employees, only: [:index, :show]
  end
