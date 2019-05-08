class TrackLinkUsage < ApplicationJob
  def perform(link:, referer: nil, user_agent: nil)
    link.uses.create!(link: link, referer: referer, user_agent: user_agent)
  end
end
