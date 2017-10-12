Rails.application.routes.draw do
  get 'new' => 'dojos#new'
  post 'dojo' => 'dojos#create', as: 'dojo_new'
  get 'show/:id' => 'dojos#showone', as: 'show_one'
  delete 'delete/:id' => 'dojos#delete', as: 'delete_one'
  get 'edit/:id' => 'dojos#edit', as: 'edit_one'
  patch 'update/:id' => 'dojos#update', as: 'update_one'
  get '' => 'dojos#show', as: 'dojo_show'
  get 'dojo/:id/student/new' => 'dojos#new_student', as: 'new_student'
  post 'dojo/:id/student/new' => 'dojos#create_student', as: 'create_student'
  get 'student/:id' => 'dojos#edit_student', as: 'edit_student'
  patch 'student/update/:id' => 'dojos#update_student', as: 'update_student'
  delete 'delete/student/:id' => 'dojos#delete_student', as: 'delete_student'

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
