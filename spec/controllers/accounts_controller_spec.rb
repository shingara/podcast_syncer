require 'spec_helper'

describe AccountsController do
  describe "Post /account" do
    context "with account create success" do
      let(:account) { PodcastSyncerModel::Account.new }
      before do
        PodcastSyncerModel::Account.expects(:create).returns(account)
        post :create
      end
      it { response.status.should eq 201 }
      it { response.should render_template 'accounts/show' }
      it { assigns(:account).should eq account }
    end

    context "with not account creation" do
      before do
        PodcastSyncerModel::Account.expects(:create).returns(nil)
        post :create
      end
      it { response.status.should eq 400 }
    end
  end
end
