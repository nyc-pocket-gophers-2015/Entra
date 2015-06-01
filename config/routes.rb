Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users, except: :index
  resources :guests, except: [:index]
  resources :places, except: [:index]
  resources :keys, except: [:index]
  resources :client_keys, only: [:new, :create, :update]

  get 'login'   => 'sessions#new'
  get 'logout'  => 'sessions#destroy'
  get 'signup'   => 'users#new'
  root 'sessions#new'

  get 'place_key/:id' => "places#key"
  get 'client_key/:client_key_id/status/:status' => "client_keys#used_at"
  get 'test/sms' => "twilio#send_text_message" # Should probably be a post
  post 'test/sms/reply' => "twilio#receive_text_message"
  get 'request_open_show/:hash' => "client_keys#request_open_show"


  get 'send_email' => "users#send_mail"






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
