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

  describe "valid AJAX POST #create" do
    it "changes the number of posts" do
      expect { xhr :post, :create, post: { content: "Lorem ipsum." } }
        .to change { Post.count }.by(1)
    end
  end

  describe "invalid POST #create" do
    it "renders the index view" do
      post :create, post: { content: " " }
      expect(response).to render_template("index")
    end
  end

  describe "invalid AJAX POST #create" do
    it "does not change the number of posts" do
      expect { xhr :post, :create, post: { content: " " } }
        .to change { Post.count }.by(0)
    end
  end
end
