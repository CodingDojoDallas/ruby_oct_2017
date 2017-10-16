Rails.application.routes.draw do
	root							'users#new'
	
	get 	'users/new' 	 => 	'users#new'
	post 	'users'			 => 	'users#create'
	
	get 	'users/:id' 	 => 	'users#show'
	
	get 	'users/:id/edit' =>		'users#edit'
	post 	'users/:id'		 =>		'users#update'
	
	get		'sessions/new'	 =>		'sessions#new',		as: 'login'
	post 	'sessions'		 =>		'sessions#create'
	delete  'sessions'		 => 	'sessions#destroy',	as: 'logout'
end
