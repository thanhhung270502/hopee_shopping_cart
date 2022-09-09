Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home' 
  get '/help', to: 'static_pages#help'
  get '/blog', to: 'static_pages#blog'
  get '/status', to: 'static_pages#status'
  get '/contact', to: 'static_pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'sign_up',    to: 'users#new'
  post 'sign_up',   to: 'users#create'
  
  get 'log_in',     to: 'sessions#new'
  post 'log_in',    to: 'sessions#create'

  delete 'log_out', to: 'sessions#destroy'

  get 'setting',    to: 'users#setting'

  get 'avaUs',     to: 'users#getAva'
  get 'avaUs',     to: 'users#setAva'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :shops
  resources :products
  resources :sizes
  resources :cart_items
  resources :cart_sessions
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  get '/products/:id/shop_products', to: 'products#showAll'
  post '/products/:id/add_product', to: 'products#getProduct', as: 'add_product'
  # get '/add_product', to: 'products#getProduct'

  # Defines the root path route ("/")
  # root "articles#index"
end
