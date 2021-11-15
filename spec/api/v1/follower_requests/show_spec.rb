require 'rails_helper'

RSpec.describe "follower_requests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/follower_requests/#{follower_request.id}", params: params
  end

  describe 'basic fetch' do
    let!(:follower_request) { create(:follower_request) }

    it 'works' do
      expect(FollowerRequestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('follower_requests')
      expect(d.id).to eq(follower_request.id)
    end
  end
end
