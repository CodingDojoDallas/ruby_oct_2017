Rails.application.routes.draw do

root 											'users#index'

get 'users' 								=> 	'users#index', 		as: 'landing' 	#show login register form

post 'users' 								=> 	'users#create', 		as: 'register'

post 'users/login' 							=> 	'users#login', 		as: 'login'

get 'users/logout' 							=> 	'users#logout', 		as: 'logout'

post 'walls/:name/messeges/:id/comments' 	=> 	'comments#create', 	as: 'create_comment' #create comment

post 'walls/:name/messages' 				=> 	'messeges#create', 	as: 'create_message' #create messege

get 'walls/:name' 							=> 	'walls#index', 		as: 'wall' #show all for that wall

end
