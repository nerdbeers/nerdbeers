Rails.application.routes.draw do

  get 'home/index'

  scope path: '/suggestions', controller: :suggestions do
    get  '/'            => :index, defaults: { viewing: :recent }
    get  '/new'         => :new
    post '/new'         => :create
    get  '/all'         => :all, defaults: { viewing: :all }
  end

  scope path: '/mgmt', controller: :mgmt do
    get  '/'            => :list
    get  '/detail/:id'  => :detail
    post 'updateagenda' => :updateagenda
  end

  namespace :api do

    resources :agenda, :only =>[] do
      collection do
        get '/' => :show
      end
    end
    
    
    resources :venues, :only =>[:index,:show]
    resources :topic, :only =>[:show]

  end

  root 'home#index'

  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
    get '422', :to => 'application#server_error'
    get '500', :to => 'application#server_error'
  end
end
