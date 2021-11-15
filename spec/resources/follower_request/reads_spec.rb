require 'rails_helper'

RSpec.describe FollowerRequestResource, type: :resource do
  describe 'serialization' do
    let!(:follower_request) { create(:follower_request) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(follower_request.id)
      expect(data.jsonapi_type).to eq('follower_requests')
    end
  end

  describe 'filtering' do
    let!(:follower_request1) { create(:follower_request) }
    let!(:follower_request2) { create(:follower_request) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: follower_request2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([follower_request2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:follower_request1) { create(:follower_request) }
      let!(:follower_request2) { create(:follower_request) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            follower_request1.id,
            follower_request2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            follower_request2.id,
            follower_request1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
