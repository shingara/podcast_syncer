require 'spec_helper'

describe 'Account API' do
  describe "Post /account" do
    context "with account create success" do
      let(:account) { Account.new }
      before do
        Account.expects(:create).returns(account)
        post '/account'
      end
      it { last_response.status.should eq 201 }
      it {
        last_response.body.should eq Rabl.render(account, 'account/show', :view_path => 'app/views')
      }
    end

    context "with not account creation" do
      before do
        Account.expects(:create).returns(nil)
        post '/account'
      end
      it { last_response.status.should eq 400 }
      it {
        last_response.body.should eq ''
      }

    end
  end
end
