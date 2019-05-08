require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to allow_value("https://cnn.com/foo/bar").for(:url) }
  it { is_expected.to allow_value("https://example.com").for(:url) }
  it { is_expected.to_not allow_value("_foo_").for(:url) }
  it { is_expected.to_not allow_value("htfp://example.com").for(:url) }
  it { is_expected.to_not allow_value("http://").for(:url) }
end
