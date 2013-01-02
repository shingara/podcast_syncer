class Repository::Account
  def initialize
    @model = PodcastSyncerModel::Account
  end

  def get(id)
    @model.find(id)
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end
end
