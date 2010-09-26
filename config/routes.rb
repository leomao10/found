Found::Application.routes.draw do
  resources :posts do
    member do
      get 'preview'
      get 'confirm'
    end	
    resource :address, :contact, :property, :enquery
  end
  resources :images
  resources :property_searches
  resources :searches
  resources :carparks
  resources :addresses do
    get 'postcode_check', 'get_post'
  end
  resources :suburbs do
    collection do
      get 'search'
    end
  end

  resources :users
  resources :user_sessions
  resources :password_resets

  match '/login' => 'user_sessions#new'
  match '/logout' => 'user_sessions#destroy'
 
  root :to => 'welcome#index'
  match ':controller(/:action/(:id))'
  match ':controller(/:action/(:id(.:format)))'
end 