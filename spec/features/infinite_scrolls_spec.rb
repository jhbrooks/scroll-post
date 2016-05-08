require 'rails_helper'

RSpec.feature "InfiniteScrolls", type: :feature do
  describe "Post index", js: true do
    let!(:post) { create(:post) }

    before(:each) do
      page.driver.browser.manage.window.resize_to(1000, 500)
      visit posts_path
    end

    it "loads more records when scrolled near the bottom" do
      create_list(:post, 20)
      expect(Post.count > 20).to be(true)
      visit current_path
      expect(page).to have_css("#posts_index li", count: 20)
      page.execute_script("window.scrollTo(0, 100000)")
      expect(page).to have_css("#posts_index li", count: 21)
    end

    it "loads more records when resized so that no scroll exists" do
      create_list(:post, 20)
      expect(Post.count > 20).to be(true)
      visit current_path
      expect(page).to have_css("#posts_index li", count: 20)
      page.driver.browser.manage.window.resize_to(1000, 5000)
      expect(page).to have_css("#posts_index li", count: 21)
    end

    it "loads more records when no scroll exists to begin with" do
      page.driver.browser.manage.window.resize_to(1000, 5000)
      create_list(:post, 20)
      expect(Post.count > 20).to be(true)
      visit current_path
      expect(page).to have_css("#posts_index li", count: 21)
    end
  end
end
