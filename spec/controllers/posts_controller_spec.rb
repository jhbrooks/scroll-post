require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "valid POST #create" do
    it "returns http redirect" do
      post :create, post: { content: "Test." }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "invalid POST #create" do
    it "renders the index view" do
      post :create, post: { content: " " }
      expect(response).to render_template("index")
    end
  end
end
