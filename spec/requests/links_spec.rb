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

  describe "GET /:id+" do
    it "shows usages for the link" do
      link = Link.create!(url: "https://kapost.com/join-our-team/")

      TrackLinkUsage.perform_now(link: link, referer: "_referrer_", user_agent: "_user_agent_")
      TrackLinkUsage.perform_now(link: link,)

      get link_path("#{link.to_param}+")
      expect(response).to be_successful

      response_json = JSON.parse(response.body)
      expect(response_json[0]).to include("referer" => "_referrer_", "user_agent" => "_user_agent_")
    end
  end
end
