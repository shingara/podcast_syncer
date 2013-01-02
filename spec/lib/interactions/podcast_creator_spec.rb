require 'spec_helper'
require 'interactions/podcast_creator'

describe Interactions::PodcastCreator do
  let(:account) {
    Account.new
  }
  let(:podcast_creator) {
    Interactions::PodcastCreator.new({:url => 'http://example.org'}, account)
  }

  describe "#execute" do
    it 'create the podcast with params' do
      lambda do
        podcast_creator.execute
      end.should change(Podcast, :count)
    end
  end

  describe "#persisted?" do
    it 'true if podcast is save' do
      Podcast.expects(:new).returns(mock(:save => true))
      podcast_creator.execute
      podcast_creator.persisted?.should be_true
    end

    it 'false if podcast is save' do
      Podcast.expects(:new).returns(mock(:save => false))
      podcast_creator.execute
      podcast_creator.persisted?.should be_false
    end
  end

end
