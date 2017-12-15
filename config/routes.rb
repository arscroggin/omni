Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
 
  resources :employees
  end
