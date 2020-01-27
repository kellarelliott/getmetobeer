require 'rails_helper'

RSpec.describe BreweriesController, type: :controller do
  describe "breweries#index action" do
    it "should successfully show the front page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "breweries#show action" do
    it "should successfully show the brewery page" do
      get :show, params: { id: 'abc_123' }
      expect(response).to have_http_status(:success)
    end

    it "should make a request with HTTParty" do
      expect(HTTParty).to receive(:get).with('https://sandbox-api.brewerydb.com/v2/brewery/abc/?key=409ef177366ff1a3e706e1ce3d0032fb')
      expect(HTTParty).to receive(:get).with('https://sandbox-api.brewerydb.com/v2/brewery/abc/locations/?key=409ef177366ff1a3e706e1ce3d0032fb')
      expect(HTTParty).to receive(:get).with('https://sandbox-api.brewerydb.com/v2/brewery/abc/beers/?key=409ef177366ff1a3e706e1ce3d0032fb')

      expect(HTTParty).to receive(:get).with('https://sandbox-api.brewerydb.com/v2/beers/?key=409ef177366ff1a3e706e1ce3d0032fb')
      get :show, params: { id: 'abc_123' }
    end
  end

end
