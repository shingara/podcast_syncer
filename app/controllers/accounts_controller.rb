require 'podcast_syncer_model/account'

class AccountsController < ApplicationController

  def create
    if @account = PodcastSyncerModel::Account.create
      render 'accounts/show', :status => 201
    else
      render :text => 'error', :status => 400
    end
  end

end
