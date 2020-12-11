Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]
  resources :users
  resources :pictures
end
