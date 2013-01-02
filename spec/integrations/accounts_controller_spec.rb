require 'spec_helper'
require 'capybara/rspec'

describe "Accounts API" do

  let(:account) { Account.create(:id => 12) }
  let(:session) { Capybara.current_session }

  describe "POST /accounts" do
    it 'should create an account' do
      lambda do
        session.driver.submit :post, '/accounts', {}
      end.should change(Account, :count).by(1)
    end
  end

  describe "GET /accounts/12" do
    before do
      account
    end
    it 'should create an account' do
      session.visit "/accounts/#{account.id}"
    end
  end
end
