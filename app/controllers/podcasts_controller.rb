require 'podcast_syncer_model/account'
require 'podcast_syncer_model/podcast'

require 'repository'

require 'interactions/podcast_creator'

class PodcastsController < ApplicationController

  before_filter :podcast, :only => [:show]
  before_filter :account, :only => [:show]

  def create
    interaction = Interactions::PodcastCreator.new(
      podcast_params, account
    )
    interaction.execute
    @podcast = interaction.podcast
    if interaction.persisted?
      render 'podcasts/show', :status => 201
    else
      render 'podcasts/error', :status => 400
    end
  end

  def show
    render 'podcasts/show'
  end

  def account
    if params[:account_id]
      @account ||= Repository.new('Account').get(params[:account_id])
    else
      @account = nil
    end
  end

  def podcast_params
    {:url => params[:url]}
  end

  def podcast
    begin
      @podcast ||= PodcastSyncerModel::Podcast.find(params[:id])
    rescue Mongoid::Errors::DocumentNotFound
      @podcast = nil
    end
    render :text => 'not found', :status => 404 unless @podcast
    @podcast
  end

end
