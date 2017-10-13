Rails.application.routes.draw do

root 											'user#index'

get 'users' 								=> 	'user#index', 		as: 'landing'

post 'users' 								=> 	'user#create', 		as: 'register'

post 'users/login' 							=> 	'user#login', 		as: 'login'

get 'users/logout' 							=> 	'user#logout', 		as: 'logout'

post 'walls/:name/messeges/:id/comments' 	=> 	'comments#create', 	as: 'create_comment' #create comment

post 'walls/:name/messages' 				=> 	'messeges#create', 	as: 'create_message' #create messege

get 'walls/:name' 							=> 	'walls#index', 		as: 'wall' #show all for that wall

end
