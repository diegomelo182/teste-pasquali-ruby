Rails.application.routes.draw do
  namespace :v1 do
    post 'auth/login'
    resources :accounts
    resources :people
    resources :contributions
    resources :transferences
  end
end
