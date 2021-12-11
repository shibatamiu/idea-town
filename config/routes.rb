Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, only: [:show]
  
  resources :thoughts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :counts, only: [:create, :destroy]
  end

  
    get 'hello/index' => 'hello#index'
    get 'ranks/rank' =>'ranks#rank'


root 'thoughts#index'
end
