Rails.application.routes.draw do



  namespace :volunteer do
    get 'dialog/index'
    post 'dialog/contact'
    get 'dialog/next'
    get 'dialog/show/:id' => 'dialog#show', as: :show_dialog

    root to: 'dashboard#index'
  end


  namespace :manager do
    root to: 'dashboard#index'
    
    get 'volunteers/index'
    get 'volunteers/show'

    get 'voters/index'  
    get 'voters/show'

    get 'data/index'
    put 'data/create'
    post 'data/import-packet/:id' => 'data#import_packet', as: :import_packet

  end


  post 'volunteer-me' => 'splash#volunteer_me', as: :volunteer_me


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'splash#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
