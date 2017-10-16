Rails.application.routes.draw do
	root							'users#new'
	
	get 	'users/new' 	 	=> 	'users#new'
	post 	'users'			 	=> 	'users#create'
	
	get 	'users/:id' 	 	=> 	'users#show'
	
	put 	'users/:id'		 	=>	'users#update',		as: 'update_user'
	get 	'users/:id/edit' 	=>	'users#edit', 		as: 'edit_user'
	
	delete 	'users/:id/delete' 	=>	'users#destroy', 	as: 'destroy_user'
	
	get		'sessions/new'	 	=>	'sessions#new',		as: 'login'
	post 	'sessions'		 	=>	'sessions#create'
	delete  'sessions'		 	=> 	'sessions#destroy',	as: 'logout'
end
