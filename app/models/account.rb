class Account
  include Mongoid::Document
  store_in :collection => 'accounts'
end
