class Repository::Account
  def initialize
    @model = Account
  end

  def get(id)
    @model.find(id)
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end
end
