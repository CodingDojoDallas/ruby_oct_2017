Rails.application.routes.draw do
	
	root							'users#new'
	
	#users routes
	get 	'users/new' 	 	=> 	'users#new'
	post 	'users'			 	=> 	'users#create'
	
	get 	'users/:id' 	 	=> 	'users#show'
	
	put 	'users/:id'		 	=>	'users#update',		as: 'update_user'
	get 	'users/:id/edit' 	=>	'users#edit', 		as: 'edit_user'
	
	delete 	'users/:id/delete' 	=>	'users#destroy', 	as: 'destroy_user'
	
	#session routes
	get		'sessions/new'	 	=>	'sessions#new',		as: 'login'
	post 	'sessions'		 	=>	'sessions#create'
	delete  'sessions'		 	=> 	'sessions#destroy',	as: 'logout'
	
	#secrets routes
	get 	'secrets'		=>	'secrets#index'
	post	'secrets'		=> 	'secrets#create'
	
	delete 	'secrets/:id'	=>	'secrets#destroy'
	
	#likes routes
	post	'likes'		=>	'likes#create'
	delete	'likes'		=>	'likes#destroy', as: 'delete_like'
	
	
end
