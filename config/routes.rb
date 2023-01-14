Rails.application.routes.draw do

  namespace :public do
    root "homes#top"
    get "/about" => "homes#about"
    get "/customers/quit" => "customers#quit"
    resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :customers, only: [:show, :update, :edit]
    resources :orders, only: [:new, :create, :show, :index]
    resources :cart_items, only: [:index, :create, :destroy, :update]
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]
    resources :order_details, only: [:update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
