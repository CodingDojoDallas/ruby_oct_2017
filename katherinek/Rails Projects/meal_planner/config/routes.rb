Rails.application.routes.draw do
  get 'ingredient_list/index' => 'ingredient_list#index'
  get 'ingredient_list/new' => 'ingredient_list#new'
  post 'ingredient_list/add' => 'ingredient_list#add'
  get 'ingredient_list/:id/show' => 'ingredient_list#show'
  get 'ingredient_list/:id/edit' => 'ingredient_list#edit'
  patch 'ingredient_list/update/:id' => 'ingredient_list#update'
  get 'ingredient_list/delete' => 'ingredient_list#delete'
  
  get 'ingredients/index' => 'ingredients#index'
  get 'ingredients/new' => 'ingredients#new'
  post 'ingredients/add' => 'ingredients#add'
  get 'ingredients/:id/show' => 'ingredients#show'
  get 'ingredients/:id/edit' => 'ingredients#edit'
  patch 'ingredients/update' => 'ingredients#update'
  get 'ingredients/delete' => 'ingredients#delete'
  
  get 'recipes/index' => 'recipes#index'
  get 'recipes/new' => 'recipes#new'
  post 'recipes/add' => 'recipes#add'
  get 'recipes/:id/show' => 'recipes#show'
  get 'recipes/:id/edit' => 'recipes#edit'
  patch 'recipes/:id/update' => 'recipes#update'
  delete 'recipes/:id/delete' => 'recipes#delete'

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
