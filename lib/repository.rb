class Repository < SimpleDelegator
  def initialize(model)
    __setobj__(Repository.const_get(model.to_s).new)
  end
end

require 'repository/account'
