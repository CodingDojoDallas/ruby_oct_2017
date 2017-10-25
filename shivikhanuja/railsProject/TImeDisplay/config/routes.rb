Rails.application.routes.draw do

  root 'time_display#index'
  get 'time_display/index' => 'time_display#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
