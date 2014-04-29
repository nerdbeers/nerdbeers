Rails.application.routes.draw do

  get 'home/index'


  namespace :api, :default => {:format => :json} do

      scope path: '/venue', controller: :venue do
        get 'list' => :list
        get 'show/:id' => :show
      end

      scope path: '/topic', controller: :topic do
        get '/:id' => :show
      end

  end
end
