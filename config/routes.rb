Rails.application.routes.draw do

  get 'home/index'


  namespace :api do#, :default => {:format => :json} do
    scope path: '/agenda', controller: :agenda do
        get '/' => :show
    end

      scope path: '/chapter', controller: :chapter do
          get '/list' => :list
          get '/show/:id' => :show
      end

      scope path: '/venues', controller: :venue do
        get '/' => :list
        get 'show/:id' => :show
      end

      scope path: '/topic', controller: :topic do
        get '/:id' => :show
      end

  end

  root 'home#index'
end
