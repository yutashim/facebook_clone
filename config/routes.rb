Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create]
  root to: 'pictures#home'
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
