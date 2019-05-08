require 'rails_helper'

RSpec.describe LinkUsage, type: :model do
  it { is_expected.to belong_to(:link) }
end
