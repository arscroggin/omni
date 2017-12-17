Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  devise_scope :user do
    root :to => "employees#index"
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
 
  resources :employees
  end
