Rails.application.routes.draw do

  get 'home/index'

  get  '/suggestion/'     => "suggestion#index", viewing: :recent
  get  '/suggestion/all'  => "suggestion#index", viewing: :all
  get  '/suggestion/new'  => "suggestion#new"
  post '/suggestion/new'  => "suggestion#create"

  scope path: '/mgmt', controller: :mgmt do
    get  '/'            => :list
    get  '/detail/:id'  => :detail
    post 'updateagenda' => :updateagenda
  end

  namespace :api do
    scope path: '/agenda', controller: :agenda do
        get '/' => :show
    end

    scope path: '/chapter', controller: :chapter do
      get '/list'     => :list
      get '/show/:id' => :show
    end

    scope path: '/venues', controller: :venue do
      get '/'        => :list
      get 'show/:id' => :show
    end

    scope path: '/topic', controller: :topic do
      get '/:id' => :show
    end

  end

  root 'home#index'

  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
    get '422', :to => 'application#server_error'
    get '500', :to => 'application#server_error'
  end
end
