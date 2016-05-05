require 'rails_helper'

RSpec.describe Post, type: :model do
  it "orders from most recent to least recent" do
    one = create(:post, content: "Test")
    most_recent = create(:post, created_at: Time.now + 60)
    two = create(:post)

    expect(Post.first).to eql(most_recent)
  end

  it "validates content presence" do
    contentless = build(:post, content: " ")

    expect(contentless.save).to be(false)
  end
end
