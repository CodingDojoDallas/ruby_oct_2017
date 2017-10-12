Rails.application.routes.draw do
  get 'dojos' => 'dojos#index', as: "landing"
  post 'dojos' => 'dojos#create'
  get 'dojos/new' => 'dojos#new'
  
  get 'dojos/:id' => 'dojos#show'
  get 'dojos/:id/students/new' => 'students#new'
  post 'dojos/:id/students/' => 'students#create'
  patch 'dojos/:id/students/' => 'students#update'
  get 'dojos/:id/students/:s_id/edit' => 'students#edit'
  delete 'dojos/:id/students/:s_id/destroy' => 'students#destroy'
  get 'dojos/:id/students/:s_id' => 'students#show'
  patch 'dojos/:id' => 'dojos#update'
  get 'dojos/:id/edit' => 'dojos#edit'
  delete 'dojos/:id/destroy' => 'dojos#destroy'
end
