require 'rails_helper'

RSpec.describe TrackLinkUsage, type: :job do
  let(:link) { Link.create!(url: "https://kapost.com/join-our-team/") }

  describe "#perform" do
    it "creates a link usage record" do
      expect { subject.perform(link: link) }.to change(LinkUsage, :count).by(1)
    end

    it "allows specifying the details of the request" do
      usage = subject.perform(
        link: link,
        user_agent: "Mozilla/5.0 (compatible; Yahoo! Slurp; _etc_)",
        referer: "https://bit.ly/2DRr9jx" # bit.ly shortened https://hre.fr
      )

      expect(usage.user_agent).to eq("Mozilla/5.0 (compatible; Yahoo! Slurp; _etc_)")
      expect(usage.referer).to eq("https://bit.ly/2DRr9jx")
    end
  end
end
