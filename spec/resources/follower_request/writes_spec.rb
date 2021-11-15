require 'rails_helper'

RSpec.describe FollowerRequestResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'follower_requests',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FollowerRequestResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FollowerRequest.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:follower_request) { create(:follower_request) }

    let(:payload) do
      {
        data: {
          id: follower_request.id.to_s,
          type: 'follower_requests',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FollowerRequestResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { follower_request.reload.updated_at }
      # .and change { follower_request.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:follower_request) { create(:follower_request) }

    let(:instance) do
      FollowerRequestResource.find(id: follower_request.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FollowerRequest.count }.by(-1)
    end
  end
end
