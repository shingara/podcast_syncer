require 'podcast'

module Interactions
  class PodcastCreator
    def initialize(podcast_params, account)
      @params = podcast_params
      @account = account
    end

    def execute
      @persisted = podcast.save
    end
    attr_reader :podcast

    def persisted?
      @persisted
    end

    def podcast
      @podcast ||= Podcast.new(@params)
    end
  end
end
