require 'spec_helper'
require 'capybara/rspec'

describe "Accounts API" do
  describe "POST /accounts" do
    it 'should create an account' do
      lambda do
        Capybara.current_session.driver.submit :post, '/accounts', {}
      end.should change(PodcastSyncerModel::Account, :count).by(1)
    end
  end
end
