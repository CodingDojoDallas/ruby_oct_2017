Rails.application.routes.draw do
  
    root 'users#new'
  
    #New User
    get 'register' => 'users#new', as: 'new_register'
    get'users/new' => 'users#new'
    #create user
    post 'register' => 'users#create', as: 'register'
    post 'users' => 'users#create'
    #show user
    get 'users/:id' => 'users#show', as: 'user'
    # New Login
    get 'login' => 'logins#new', as:'new_login'
    get 'logins/new' => 'logins#new'
    # Login
    post 'login' => 'logins#create' ,as: 'login'
    post 'logins'  => 'logins#create'
    # Logout   
    delete 'logout' => 'logins#destroy', as: 'logout'
    delete 'logins' => 'logins#destroy' 
  
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  
