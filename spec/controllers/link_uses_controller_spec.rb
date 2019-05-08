require 'rails_helper'

RSpec.describe LinkUsesController, type: :controller do
  let(:link) { Link.create!(url: "https://kapost.com/join-our-team/") }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { link_id: link.id }, session: valid_session
      expect(response).to be_successful
    end
  end
end
