FactoryGirlApi::Engine.routes.draw do
  resource :database, only: [:create, :destroy]
  resources :factories, only: [:create]
end
