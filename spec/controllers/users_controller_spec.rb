require 'rails_helper'

RSpec.describe UsersController, type: :controller do
describe "users#show" do
    it "should show user page" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to have_http_status :success
    end
  end
end
