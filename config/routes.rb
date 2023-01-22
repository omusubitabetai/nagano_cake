Rails.application.routes.draw do

  root 'public/homes#top'

  devise_for :customers,skip: [:passwords], controllers: {
  sessions: 'public/sessions',
  registrations: 'public/registrations',
  }

  devise_for :admin, skip: [:registrations,:passwords] ,controllers: {
  sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/admin' => 'homes#top'
    resources :items
    resources :customers
    resources :orders,only:[:index,:show,:update]
    resources :order_details, only: [:update]
  end

  namespace :public do
    get '/about' => 'homes#about'
    delete '/cart_items/all_destroy' => 'cart_items#destroy_all'
    resources :items, only: [:index, :show]
    get '/customers/edit' => 'customers#edit'
    patch '/customers/update' => 'customers#update'
    patch '/customers/out' => 'customers#out'
    get '/customers/quit' => 'customers#quit'

    resources :cart_items
    post '/orders' => 'orders#create'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanx' => 'orders#thanx'
    resources :orders, only: [:new,:create,:show,:index]
    resource :customers, only:[:show ,:edit,:update]
    resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
