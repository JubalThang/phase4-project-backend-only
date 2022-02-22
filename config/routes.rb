Rails.application.routes.draw do
 
      resources :posts, only: [:show, :create]
    
      get '/home', to: 'posts#index'
      post '/login', to: 'session#create'
      post '/signup', to: 'users#create'
      post '/logout', to: 'session#destroy'

      post '/comments', to: 'comment#create'
end
