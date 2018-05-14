Rails.application.routes.draw do
  namespace :v1 do
    resources :accounts
    resources :people
  end
end
