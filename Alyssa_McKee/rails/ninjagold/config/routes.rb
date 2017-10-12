Rails.application.routes.draw do
  root 'games#index'
  
  post 'handle' => "games#handle", as: 'handle'
end
