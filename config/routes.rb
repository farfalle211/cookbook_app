Rails.application.routes.draw do
  namespace :api do
      get '/recipes' => 'recipes#index'   #recipes must be plural according to restful routing conventions
      get '/recipes/:id' => 'recipes#show'  #show displays a single photo, must have a wildcard :id
      post '/recipes' => 'recipes#create'
  end
end
