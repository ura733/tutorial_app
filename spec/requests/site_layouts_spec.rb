require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "layout links" do
    it "Home Access" do
      get root_path
      expect(response).to render_template(:home)
      expect(response).to have_http_status(200)
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
    end
  end
end
