require 'rails_helper'

RSpec.describe "follower_requests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/follower_requests/#{follower_request.id}"
  end

  describe 'basic destroy' do
    let!(:follower_request) { create(:follower_request) }

    it 'updates the resource' do
      expect(FollowerRequestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { FollowerRequest.count }.by(-1)
      expect { follower_request.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
