Rails.application.routes.draw do

  root to: 'posts#home_feed'
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  #POSTS
  get '/posts/text', to: 'posts#text'
  post '/posts/create', to: 'posts#create'
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/json', to: 'posts#show_json'
  get '/home/json', to: 'posts#home_json'

  get '/reblog/:id', to: 'posts#reblog'
  post '/reblog/:id', to: 'posts#submit_reblog'

  #COMMENTS
  post '/posts/:id/comment', to: 'posts#new_comment'
  post '/posts/:id/comment/:id/delete', to: 'posts#delete_comment'
  post '/posts/:id/comment/:id/edit', to: 'posts#edit_comment'

  #COMMUNITIES
  get '/community/create', to: 'communities#create'
  post '/community/create', to: 'communities#create_submit'
  get '/community/:name', to: 'communities#show'
  get '/community/:name/posts/json', to: 'communities#posts_json'
  get '/community/:name/forum/json', to: 'communities#forum_json'
  post '/community/:name/join', to: 'communities#join'
  post '/community/:name/leave', to: 'communities#leave'

  #USERS
  get '/:username', to: 'users#show', as: 'user'
  get '/:username/json', to: 'users#show_json'

  #FOLLOWING
  post '/:username/follow', to: 'follows#user_create'
  post '/community/:name/follow', to: 'follows#comm_create'

  #VIEW TAGS

get '/tagged/:tag', to: 'posts#tagged'



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
  #   concern :toggleable d
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
