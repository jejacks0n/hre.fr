require 'rails_helper'

RSpec.describe "Links", type: :request do
  describe "GET /:id" do
    it "redirects to the expected url" do
      link = Link.create!(url: "https://kapost.com/join-our-team/")
      get link_path(link.to_param)
      expect(response).to have_http_status(301)
      expect(response).to redirect_to(link.url)
    end
  end
end
