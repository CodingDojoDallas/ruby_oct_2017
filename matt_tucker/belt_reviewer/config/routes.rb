Rails.application.routes.draw do
  # User Routes
  root 'users#new'

  # New User
  get   'register'      => 'users#new',         as: 'new_register'
  get   'users/new'     => 'users#new'
  # Create User
  post  'register'      => 'users#create',      as: 'register'
  post  'users'         => 'users#create'
  # Show User
  get   'users/:id'     => 'users#show',        as: 'user' 
  # New Login
  get   'login'         => 'sessions#new',      as: 'new_login'
  get   'sessions/new'  => 'sessions#new'
  # Login
  post  'login'         => 'sessions#create',   as: 'login'
  post  'sessions'      => 'sessions#create'
  # Logout
  delete    'logout'    => 'sessions#destroy',  as: 'logout'
  delete    'sessions'  => 'sessions#destroy'

  # Event Routes
  get   'events'        => 'events#index',      as: 'events'
  post  'events'        => 'events#create',     as: 'create_event'
  get   'events/:id'    => 'events#show',       as: 'event'
  delete 'events/:id'   => 'events#destroy',    as: 'delete_event'

  # Attends Routes
  post  'join_event'    => 'attends#create',    as: 'join_event'
  delete 'leave_event'  => 'attends#destroy',   as: 'leave_event'

  # Messages Routes
  post  'messages'      => 'messages#create',   as: 'create_message'
end
