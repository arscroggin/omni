Rails.application.routes.draw do

  unauthenticated do
    root :to => 'welcome#index'
  end
 
  authenticated do
    root :to => 'employees#index'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
 
  resources :employees
  end
