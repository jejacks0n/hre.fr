require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to allow_value("https://cnn.com/foo/bar").for(:url) }
  it { is_expected.to allow_value("https://example.com").for(:url) }
  it { is_expected.to_not allow_value("_foo_").for(:url) }
  it { is_expected.to_not allow_value("htfp://example.com").for(:url) }
  it { is_expected.to_not allow_value("http://").for(:url) }

  describe "serializing" do
    subject { Link.new(id: 42, url: "https://cnn.com") }

    it "replaces id with a more consistent representation" do
      expect(subject.as_json).to include(
        "id" => "gqBS0y",
        "url" => "https://cnn.com"
      )
    end
  end
end
