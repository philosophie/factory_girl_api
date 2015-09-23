module FactoryGirlApi
  class FactoriesController < FactoryGirlApi::ApplicationController
    def create
      model = FactoryGirl.create(factory_name, *traits, attributes)
      render json: model, status: :created
    end

    private

    def factory_params
      @factory_params ||= params.require(:factory).permit!
    end

    def factory_name
      @factory_name ||= factory_params.require(:name)
    end

    def traits
      @traits ||= begin
        strings = factory_params[:traits] || []
        strings.map(&:to_sym)
      end
    end

    def attributes
      @attributes ||= factory_params.fetch(:attributes, {})
    end
  end
end
