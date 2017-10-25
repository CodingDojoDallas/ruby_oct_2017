Rails.application.routes.draw do
  root 'survey#index' 
  
  get 'survey/result' => 'survey#result'
  post 'survey/index' => 'survey#process_survey' 
