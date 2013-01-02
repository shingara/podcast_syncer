require 'spec_helper'
require 'repository'

describe Repository::Account do
  let(:account) { Account.create }

  let(:repository_account) {
    described_class.new
  }

  describe '#get' do
    context "with unknown account search" do
      it 'return nil' do
        repository_account.get(Moped::BSON::ObjectId.new).should be_nil
      end
    end

    context "with account exist" do
      it 'return the account' do
        repository_account.get(account.id).should eq account
      end
    end

  end
end
