require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:followed_requests) }

    it { should have_many(:follower_requests) }

    it { should have_many(:photos) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    end

    describe "InDirect Associations" do

    it { should have_many(:photo_comments) }

    it { should have_many(:photo_likes) }

    end

    describe "Validations" do

    end
end
