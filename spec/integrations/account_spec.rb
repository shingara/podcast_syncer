require 'spec_helper'

describe 'Account API' do
  describe "POST CREATE" do

    it 'should create an new account and return is id' do
      lambda do
        post '/account'
      end.should change(Account, :count)
      last_response.status.should eq 201
      new_account = Account.last
      last_response.body.should eq({
        'id' => new_account.id,
        'links' => {
          'self' => "/account/#{new_account.id}"
        }
      }.to_json)
    end
  end
end
