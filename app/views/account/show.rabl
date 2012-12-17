object @account
attribute :id
node :links do |account|
  {
    'self' => "/account/#{account.id}"
  }
end
