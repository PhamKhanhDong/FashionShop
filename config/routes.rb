Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"
  namespace :admin do
    get "/", to: "base#index"
    resources :addresses
    resources :brands, except: :show
    resources :products, except: :show do
      post :active, on: :member
    end
    resources :orders
    resources :payments, except: :show
    resources :rates, only: %i(index update destroy)
    resources :shippings
    resources :slides, except: :show
    resources :users, except: :show do
      post :activated, on: :member
    end
    resources :categories, except: :show do
      post :active, on: :member
    end
  end

  root "products#index"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to:"users#new"
  get "/my-account", to: "users#show"
  get "/shopping_cart", to: "cart#shopping_cart"
  get "/signup", to:"users#new"
  get "/update-account/:id", to: "users#edit", as: :update_account
  get "search(/:search)", to: "search#index", as: :search
  get "search_brand(/:search)", to: "search1#index", as: :search_brand
  root "products#index"
  resources :products, only: :show do
    resources :rates, only: :create
    resources :wishlists, only: :create
    get "/new", to: "products#new_products", on: :collection
    get :hot, on: :collection
    resources :comments, only: :create
  end
  resources :wishlists, only: %i(index destroy)
  resources :account_activations, only: :edit
  patch "/update-account/:id", to: "users#update"
  post "/add_to_cart/:id", to: "carts#add", as: :add_to_cart
  post "/remove_cart/:id", to: "carts#destroy", as: :remove_cart
  post "/remove_product_from_cart/:id", to: "carts#destroy",
    as: :remove_product_from_cart
  post "/signup", to:"users#create"
  post "/update_cart/:id", to: "carts#update", as: :update_cart
  put "/update-account/:id", to: "users#update"

  resources :products
  resources :account_activations, only: :edit
  resources :carts, only: :index
  resources :addresses
  resources :checkouts, only: %i(index create) do
    collection do
      get "/ajax_address", to: "checkouts#ajax_address"
    end
  end
  resources :categories, only: %i(index show)
  resources :brands, only: %i(index show)
  get "products/:id/:friend_url", to: "products#show", as: :product1
end
