require 'rails_helper'

RSpec.describe "posts/index", :type => :view do
  before(:each) do
    assign(:post, build(:post))
    @posts = assign(:posts, [create(:post), create(:post)])
  end

  it "renders a _post partial for each post" do
    render
    expect(view).to render_template(partial: "_post", :count => 2)
  end

  it "includes the content of each post" do
    render
    @posts.each do |post|
      expect(rendered).to include(post.content)
    end
  end

  it "includes a post create form" do
    render
    assert_select "form"
    assert_select "textarea"
  end
end
