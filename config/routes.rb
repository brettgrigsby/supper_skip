Rails.application.routes.draw do
 resources :restaurants, only: [:index, :new, :create, :show, :edit, :update] do
   resources :items,       only: [:index, :show]
 end

  resources :categories,  only: [:index, :show]
  resources :users,       only: [:new, :create, :show, :index ]
  resources :sessions,    only: [:new, :create, :destroy]
  resources :order_items, only: [:update]
  resources :orders,      only: [:new, :create]
  resources :addresses

  namespace :admin do
    resources :restaurants, only: [:show, :edit, :update, :destroy] do
      resources :items, only: [:edit, :update, :destroy, :new, :create]
      resources :categories, only: [:new, :create, :edit, :update]
      resources :orders, only: [:index, :show, :edit, :update, :destroy]
      resources :user_roles, only: [:new, :create]
    end
    resources :categorizations, only: [:create, :destroy]
    resources :items do
      member do
        put    :add_category
        delete :remove_category
        post   :extinction
      end
    end
    resources :categories
    resources :orders, only: [:index, :show, :edit, :update]
  end

  post '/cart', to: 'cart_items#create'
  get '/cart', to: 'cart_items#index'
  put '/cart', to: 'cart_items#update'


  get   '/menu',             to: 'items#index'
  match '/about_us',         to: 'pages#about_us',    via: 'get'
  match '/signup',           to: 'users#new',         via: 'get'
  match '/login',            to: 'sessions#new',      via: 'get'
  match '/logout',           to: 'sessions#destroy',  via: 'delete'
  get   '/paid',             to: 'orders#paid'
  get   '/checkout',         to: 'orders#checkout'
  get   '/confirm',          to: 'orders#confirm'
  match '/admin_dashboard',  to: 'admin#dashboard',   via: 'get'
  get   '/code',             to: 'pages#code'
  put   '/admin/order_items/:id', to: 'admin/order_items#update'
  match "*a",                to: 'errors#routing_error', via: 'get'

  root to: 'restaurants#index'
  #root  'pages#home'
end
