require 'database_cleaner'

module FactoryGirlApi
  class DatabasesController < FactoryGirlApi::ApplicationController
    def create
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      render json: {}
    end

    def destroy
      DatabaseCleaner.clean
      render json: {}
    end
  end
end
