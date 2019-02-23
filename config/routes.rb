Rails.application.routes.draw do
  namespace :api do

      post'/users' => 'users#create'

      post '/sessions' => 'sessions#create'

      
      get '/recipes' => 'recipes#index'   #recipes must be plural according to restful routing conventions
      post '/recipes' => 'recipes#create'
      get '/recipes/:id' => 'recipes#show'  #show displays a single photo, must have a wildcard :id
      patch '/recipes/:id' => 'recipes#update'
      delete '/recipes/:id' => 'recipes#destroy'

  end
end


#string query params --> 