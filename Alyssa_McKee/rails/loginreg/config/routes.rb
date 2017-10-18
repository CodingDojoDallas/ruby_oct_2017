Rails.application.routes.draw do
  root							'sessions#new', 		as: 'landing'
  
  
  # ------users
  
  get	'/users'			=>	'users#index', 		as: 'dashboard'
  
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
  
  
  
  #catch all url errors
  match 	'*path'	=>	'sessions#error', via: :all
  
end
