Rails.application.routes.draw do
  root 'home#index'
  resources :users, only:[:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :ideas do
    resources :reviews, only: [:create, :destroy]
    resources :likes, shallow: true, only: [:create, :destroy]
    get :liked, on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
