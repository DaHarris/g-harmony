Rails.application.routes.draw do
  resources :posts do
    get '/like' => 'posts#like'
  end

root 'posts#index'

resources :users

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' =>'sessions#destroy'

end
