Rails.application.routes.draw do
  


get 'posts' => 'posts#index', as: 'all_posts'
post 'posts'  => 'posts#create'
get 'posts/new'  => 'posts#new' , as: 'new_post'
get 'posts/:id'  => 'posts#show' , as: 'post'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
