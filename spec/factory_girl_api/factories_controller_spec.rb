require 'spec_helper'

describe FactoryGirlApi::FactoriesController, type: :controller do
  routes { FactoryGirlApi::Engine.routes }

  describe 'POST #create' do
    it 'uses the factory to create a model' do
      params = {
        factory: {
          name: 'widget'
        }
      }
      expect { post :create, params }.to change { Widget.count }.by 1
    end

    it 'allows attributes to be specified' do
      params = {
        factory: {
          name: 'widget',
          attributes: {
            name: 'fancy widget'
          }
        }
      }
      post :create, params
      expect(Widget.last.name).to eq 'fancy widget'
    end

    it 'allows traits to be specified' do
      params = {
        factory: {
          name: 'widget',
          traits: ['expensive']
        }
      }
      post :create, params
      expect(Widget.last.price).to eq 1000
    end
  end
end
