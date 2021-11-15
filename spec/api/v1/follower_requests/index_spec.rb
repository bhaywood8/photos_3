require 'rails_helper'

RSpec.describe "follower_requests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/follower_requests", params: params
  end

  describe 'basic fetch' do
    let!(:follower_request1) { create(:follower_request) }
    let!(:follower_request2) { create(:follower_request) }

    it 'works' do
      expect(FollowerRequestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['follower_requests'])
      expect(d.map(&:id)).to match_array([follower_request1.id, follower_request2.id])
    end
  end
end
