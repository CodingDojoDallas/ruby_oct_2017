Rails.application.routes.draw do

  get 'animes' => 'animes#index'
  get 'animes/new' => 'animes#new' 
  post 'animes'  => 'animes#make' #when user make post request where it should show after creation
  get 'animes/:id' => 'animes#show'#when user make get request for it to show on its own show page
  get 'animes/:id/edit' => 'animes#edit'
  patch 'animes/:id' => 'animes#update'
  delete 'animes/:id' => 'animes#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
