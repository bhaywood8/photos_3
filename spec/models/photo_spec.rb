require 'rails_helper'

RSpec.describe Photo, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_many(:user_comments) }

    it { should have_many(:user_likes) }

    end

    describe "Validations" do

    end
end
