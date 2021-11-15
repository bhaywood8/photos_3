require "rails_helper"

RSpec.describe "follower_requests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/follower_requests/#{follower_request.id}", payload
  end

  describe "basic update" do
    let!(:follower_request) { create(:follower_request) }

    let(:payload) do
      {
        data: {
          id: follower_request.id.to_s,
          type: "follower_requests",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FollowerRequestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { follower_request.reload.attributes }
    end
  end
end
