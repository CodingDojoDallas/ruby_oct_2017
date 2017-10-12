Rails.application.routes.draw do

 

  root 'says#index'
    
  get 'hello' => 'hellos#index'
	
  get 'times' => 'times#index'

  get 'times/restart' => 'times#restart'

  

  get 'say/hello' => 'says#hello'

  get 'say/hello/joe' => 'says#joe'

  get 'say/hello/michael' => 'says#michael'

end
