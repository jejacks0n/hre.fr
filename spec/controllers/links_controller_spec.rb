require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:valid_attributes) {
    {
      url: "https://kapost.com/join-our-team/"
    }
  }

  let(:invalid_attributes) {
    {
      url: "_foo_"
    }
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "redirects to the expected url" do
      link = Link.create!(valid_attributes)
      get :show, params: { id: link.to_param }, session: valid_session
      expect(response).to redirect_to(link.url)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, params: { link: valid_attributes }, session: valid_session
        }.to change(Link, :count).by(1)
      end

      it "renders a JSON response with the new link" do
        post :create, params: { link: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(link_url(Link.last))
        expect(JSON.parse(response.body)).to include(
          "url" => "https://kapost.com/join-our-team/",
        )
      end

      it "doesn't create more than one record per unique url" do
        link = Link.create!(valid_attributes)

        post :create, params: { link: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include(
          "id" => link.to_param
        )
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new link" do
        post :create, params: { link: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)).to include(
          "url" => ["is not a valid URL"],
        )
      end
    end
  end
end
