Rails.application.routes.draw do
  
  root 'static_pages#home'

  get 'sessions/new'

  get 'users/new'

  patch 'update_user' => 'users#update' 

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

delete 'logout' => 'sessions#destroy'

  resources :users

end
