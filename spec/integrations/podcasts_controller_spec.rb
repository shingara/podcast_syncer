require 'spec_helper'
require 'capybara/rspec'

describe "podcasts API" do

  let(:podcast) { Account.create(:url => 'http://feeds.feedburner.com/RubyRogues') }

  let!(:account) { Account.create(:id => 12) }
  let!(:session) { Capybara.current_session }

  describe "POST /accounts/:id/podcasts" do
    it 'should create a podcast' do
      lambda do
        session.driver.submit :post, "/accounts/#{account.id}/podcasts", {
          :url => 'http://feeds.feedburner.com/RubyFreelancersShow'
        }
      end.should change(Podcast, :count).by(1)
    end
  end

  describe "GET /podcasts/:id" do
    before do
      podcast
    end
    it 'should create an account' do
      session.visit "/podcasts/#{podcast.id}"
    end
  end

  describe "GET /podcasts/:id" do
    before do
      podcast
    end
    it 'should create an account' do
      session.visit "/accounts/#{account.id}/podcasts/#{podcast.id}"
    end
  end
end
