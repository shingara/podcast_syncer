require 'spec_helper'

describe AccountsController do

  let(:account) { Account.new }

  describe "Post /account" do
    context "with account create success" do
      before do
        Account.expects(:create).returns(account)
        post :create
      end
      it { response.status.should eq 201 }
      it { response.should render_template 'accounts/show' }
      it { assigns(:account).should eq account }
    end

    context "with not account creation" do
      before do
        Account.expects(:create).returns(nil)
        post :create
      end
      it { response.status.should eq 400 }
    end
  end

  describe "GET /accounts/:id" do
    before do
      Account.expects(:find).with('12').returns(account)
      get :show, :id => 12
    end
    it { response.should be_success }
    it { assigns(:account).should eq account }
    it { response.should render_template('accounts/show') }
  end
end
