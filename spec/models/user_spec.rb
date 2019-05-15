require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to allow_value("pAssw0rd").for(:password) }
  it { is_expected.to allow_value("ABC123").for(:password) }
  it { is_expected.to allow_value("badpassword1").for(:password) }
  it { is_expected.to_not allow_value("Abcdef").for(:password) }
  it { is_expected.to_not allow_value(nil).for(:password) }

  describe "validation" do
    describe "on passwords" do
      it "requires at least 2 passes on validation requirements" do
        subject.password = "abc123"
        expect(subject.valid?).to be_falsey # fails length and capital letter

        subject.password = "Abcdefxyz"
        expect(subject.valid?).to be_truthy # only fails on numeric check
      end
    end
  end
end
