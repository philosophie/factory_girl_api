Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount FactoryGirlApi::Engine => '/test_helpers'
    end
  end
end
