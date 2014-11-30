Rails.application.routes.draw do
  resources :matches
  root 'matches#index'
end
