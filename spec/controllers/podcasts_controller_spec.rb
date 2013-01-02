require 'spec_helper'

describe PodcastsController do

  let(:account) { Account.new }
  let(:podcast) { Podcast.new }
  let(:account_repository) {
    rep = Object.new
    rep.stubs(:get).with(account.id.to_s).returns(account)
    rep
  }

  describe "Post /account/:id/podcasts" do
    context "with valid account" do
      before do
        Repository.expects(:new).with('Account').returns(
          account_repository
        )
      end
      context "with podcast create success" do
        before do
          Interactions::PodcastCreator.expects(:new).with(
            {:url => 'http://example.org'},
            account
          ).returns(mock(
            :execute => true,
            :persisted? => true,
            :podcast => podcast
          ))
          post :create, :account_id => account.id.to_s, :url => 'http://example.org'
        end
        it { response.status.should eq 201 }
        it { response.should render_template 'podcasts/show' }
        it { assigns(:podcast).should eq podcast }
      end

      context "with invalid podcast creation" do
        before do
          Interactions::PodcastCreator.expects(:new).returns(mock(
            :execute => true,
            :persisted? => false,
            :podcast => podcast
          ))
          post :create, :account_id => account.id.to_s, :url => 'hello'
        end
        it { response.status.should eq 400 }
        it { response.should render_template 'podcasts/error' }
      end
    end
  end

  describe "GET /podcasts/:id" do
    context "with a podcast exist" do
      before do
        Podcast.expects(:find).with('12').returns(podcast)
        get :show, :id => 12
      end
      it { response.should be_success }
      it { assigns(:podcast).should eq podcast }
      it { response.should render_template('podcasts/show') }
    end
    context "without podcast exists" do
      before do
        Podcast.expects(:find).with('12').returns(nil)
        get :show, :id => 12
      end
      it { response.status.should eq 404 }
    end
  end

  describe "GET /account/:id/podcasts/:id" do
    context "with a podcast exist" do
      before do
        Podcast.expects(:find).with('12').returns(podcast)
        Account.expects(:find).with('1').returns(account)
        get :show, :id => 12, :account_id => 1
      end
      it { response.should be_success }
      it { assigns(:podcast).should eq podcast }
      it { assigns(:account).should eq account }
      it { response.should render_template('podcasts/show') }
    end
    context "without podcast exists" do
      before do
        Podcast.expects(:find).with('12').returns(nil)
        get :show, :id => 12, :account_id => 1
      end
      it { response.status.should eq 404 }
    end
  end
end
