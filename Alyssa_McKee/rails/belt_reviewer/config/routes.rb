Rails.application.routes.draw do
  root							'sessions#new', 		as: 'landing'
  
  
  # ------users
  
  get	'/users'			=>	'users#index'	#,	as: 'dashboard'
  
  get 	'/register'			=>	'users#new', 		as: 'register'
  get	'/users/new'		=>	'users#new'
  post	'/users'			=>	'users#create',		as: 'create_user'
  
  get	'/users/:id'		=>	'users#show',		as: 'show_user'
  
  get	'/users/:id/edit'	=>	'users#edit', 		as:	'edit_user'
  put	'/users/:id'		=>	'users#update',		as:	'update_user'
  
  delete  '/users/:id'		=>	'users#destroy',	as:	'destroy_user'
  
  #------session
  
  get 	'/login'			=>	'sessions#new',		as:	'login'
  get 	'/session/new'		=>	'sessions#new'
  
  post	'/session'			=>	'sessions#create'

  delete  '/session'		=>	'sessions#destroy', as:	'logout'
  
  #------events
  get	'/events'			=>	'events#index', 	as: 'dashboard'
  
  post	'/events'			=>	'events#create', 	as: 'create_event'
  
  get 	'/events/:id'		=>	'events#show',		as: 'show_event'
  
  get	'/events/:id/edit'		=> 	'events#edit', 	as: 'edit_event'
  put	'/events/:id'		=> 	'events#update', 	as: 'update_event'
  
  delete '/events/:id'		=>	'events#destroy', 	as: 'destroy_event'
  #-------attends
  
  post 	'/attends/:id'	=>	'attends#create', as: 	'join_event'
  
  delete '/attends/:id'	=>	'attends#destroy', as: 'cancel_event'
  #-------comments
  
  post	'events/:id/comments/create'	=>	'comments#create', as: 	'create_comment'
  
  
  #----catch all url errors
  match 	'*path'	=>	'sessions#error', via: :all
  
end
