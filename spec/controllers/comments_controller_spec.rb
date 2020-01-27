require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
 describe "comments#index" do
    it "should list the  in the database" do
      comment1 = FactoryBot.create(:comment)
      comment2 = FactoryBot.create(:comment)
      get :index
      expect(response).to have_http_status :success
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value.count).to eq(2)
    end
  end

  describe "comments#create" do
    it "shoulw allow a user to create a new task" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: {comment: {message: "This place is the best", rating: 5}}
      expect(response).to have_http_status(:success)
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value['message']).to eq("This place is the best")
      expect(Comment.last.message).to eq("This place is the best")
    end
  end
end
