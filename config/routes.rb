Rails.application.routes.draw do

  unauthenticated do
    root :to => 'welcome#index'
  end
 
  authenticated do
    root :to => 'employees#index'
  end

  devise_for :users, controllers: { saml_sessions: "saml_sessions"}

  resources :employees, only: [:index, :show]

  resources :organizations, only: [:edit, :show]

  end
