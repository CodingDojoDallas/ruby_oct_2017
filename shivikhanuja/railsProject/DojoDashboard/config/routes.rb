Rails.application.routes.draw do
  root 'dojos#index'
  get 'dojos' => 'dojos#index'
  get 'dojos/new' => 'dojos#new'
  post 'dojos' => 'dojos#create' , as: 'dojos_create'
  get  'dojos/:id' => 'dojos#show'
  get 'dojos/:id/edit' => 'dojos#edit'
  patch 'dojos/:id' => 'dojos#update'
  delete 'dojos/:id' => 'dojos#destroy'

  get 'dojos/:dojo_id/students' => 'students#new'
  post 'dojos/:dojo_id/students' => 'students#create'
  get 'dojos/:dojo_id/students' => 'students#show'
  patch 'students/:id' => 'students#update'
  delete 'students/:id' => 'students#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
