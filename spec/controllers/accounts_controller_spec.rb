require 'spec_helper'

describe AccountsController do
  describe "Post /account" do
    context "with account create success" do
      let(:account) { PodcastSyncerModel::Account.new }
      before do
        PodcastSyncerModel::Account.expects(:create).returns(account)
        post '/account'
      end
      it { response.status.should eq 201 }
      it { response.should render_template 'accounts/show' }
    end

    context "with not account creation" do
      before do
        PodcastSyncerModel::Account.expects(:create).returns(nil)
        post '/account'
      end
      it { response.status.should eq 400 }
    end
  end
end
