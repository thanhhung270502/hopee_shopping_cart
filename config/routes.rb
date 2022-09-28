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
  patch 'avaUs',     to: 'users#setAva'

  get 'edit_password',     to: 'users#edit_password'
  patch 'edit_password',     to: 'users#update_password'

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
  resources :orders
  resources :transport, only: [:create, :destroy]
  resources :account_activations, only: [:edit]


  get '/products/:id/shop_products', to: 'products#showAll'
  post '/products/:id/add_product', to: 'products#getProduct', as: 'add_product'
  
  patch '/products/:id/toggle_hot', to: 'products#toggle_hot', as: 'toggle_hot'
  patch '/products/:id/publicProduct', to: 'products#publicProduct', as: 'publicProduct'
  patch '/products/:id/discount', to: 'products#discount', as: 'discount'

  get '/products/:id/editQuantity', to: 'products#editQuantity', as: 'editQuantity'
  patch '/products/:id/editQuantity', to: 'products#updateQuantity'

  get '/arrivals_HS', to: 'products#arrivals_HS'
  get '/arrivals_TP', to: 'products#arrivals_TP'
  get '/arrivals_TJ', to: 'products#arrivals_TJ'

  patch '/shops/:id/editProfile', to: 'shops#editProfile', as: 'editProfile'

  # get 'update_quantity', to: 'cart_items#update_quantity'
  patch '/update_quantity', to: 'cart_items#update_quantity'
  
  post '/cart_sessions/:id/order', to: 'cart_sessions#checkout', as: 'orderz'

  post 'order_informations/:id/updateTransport', to: "order_informations#updateTransport", as: 'updateTransport'
  patch 'order_informations/:id/nextStatus', to: "order_informations#nextStatus", as: 'nextStatus'
  patch 'order_informations/:id/prevStatus', to: "order_informations#prevStatus", as: 'prevStatus'

  get 'search', to: 'search#index'
  # get '/add_product', to: 'products#getProduct'

  # Defines the root path route ("/")
  # root "articles#index"
end
