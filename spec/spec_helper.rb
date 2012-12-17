PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.mock_with :mocha
  conf.include Rack::Test::Methods
  conf.include Mongoid::Matchers
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  PodcastSyncer.tap { |app|  }
end
