Rails.application.routes.draw do

  get 'home/index'

  scope path: '/', controller: :home do
    get  '/'            => :index
    get  '/event'         => :event
  end

  scope path: '/suggestions', controller: :suggestions do
    get  '/'            => :index, defaults: { viewing: :recent }
    get  '/new'         => :new
    post '/new'         => :create
    get  '/all'         => :all, defaults: { viewing: :all }
  end

  namespace :mgmt do
    get '/' => "dashboard#index"

    resources :dashboard, :only => [:index]

    resources :agendas
    resources :venues
  end

  namespace :api do
    get '/' => "agenda#show"

    resources :agenda, :only =>[] do
      collection do
        get '/'    => :show
        get '/all' => :all
      end
    end

    resources :venues, :only =>[:index,:show]
    resources :suggestions, :only =>[] do
      collection do
        get  '/'    => :index
        get  '/all' => :all
        get  '/:id' => :show
        post '/new' => :create
      end
    end
    
    resources :robots, :only =>[] do
      collection do
        post '/vacuum'       => :vacuum
        post '/clearmetrics' => :clearmetrics
      end
    end
  end

  root 'home#index'

  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
    get '422', :to => 'application#server_error'
    get '500', :to => 'application#server_error'
  end
end
