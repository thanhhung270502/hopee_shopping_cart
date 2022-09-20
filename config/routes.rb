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
  resources :reviews
  resources :order_informations
  resources :transport, only: [:create, :destroy]

  get '/products/:id/shop_products', to: 'products#showAll'
  post '/products/:id/add_product', to: 'products#getProduct', as: 'add_product'
  
  patch '/products/:id/toggle_hot', to: 'products#toggle_hot', as: 'toggle_hot'
  patch '/products/:id/publicProduct', to: 'products#publicProduct', as: 'publicProduct'

  get '/products/:id/editQuantity', to: 'products#editQuantity', as: 'editQuantity'
  patch '/products/:id/editQuantity', to: 'products#updateQuantity'

  get '/shops/:id/showHot', to: 'shops#showHot', as: 'showHot'

  # get 'update_quantity', to: 'cart_items#update_quantity'
  patch '/update_quantity', to: 'cart_items#update_quantity'

  post '/cart_sessions/:id/order', to: 'cart_sessions#checkout', as: 'order'

  post 'order_informations/:id/updateTransport', to: "order_informations#updateTransport", as: 'updateTransport'
  patch 'order_informations/:id/nextStatus', to: "order_informations#nextStatus", as: 'nextStatus'
  patch 'order_informations/:id/prevStatus', to: "order_informations#prevStatus", as: 'prevStatus'
  # get '/add_product', to: 'products#getProduct'

  # Defines the root path route ("/")
  # root "articles#index"
end
